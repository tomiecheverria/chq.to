class LinksController < ApplicationController
  include LinksHelper
  include WillPaginate::CollectionMethods
  before_action :authenticate_user!, only: %i[index new create show edit update destroy]
  before_action :find_link, only: %i[show edit update destroy]

  def index
    @links = current_user.links.paginate(page: params[:page], per_page: 4)
  end

  def new
    @link = build_new_link(current_user)
  end

  def create
    @link = build_link_with_type(current_user, link_params)
    save_or_redirect(@link, 'Link successfully created.', user_path(current_user), new_link_path)
  end

  def show
    @link_visits = filtered_visits
  end

  def edit; end

  def update
    update_or_redirect(@link, 'Link successfully updated.', user_path(current_user), edit_link_path(@link))
  end

  def destroy
    @link.destroy
    redirect_to_with_notice('Link successfully deleted.', user_path(current_user))
  end

  def redirect
    @link = Link.find_by(slug: params[:slug])
    if @link
      handle_valid_link(@link)
    else
      handle_invalid_link
    end
  end

  def handle_private_link_form
    @link = Link.find(params[:id])
    password_matches?(params[:password], @link) ? create_and_redirect_to_link(@link) : handle_invalid_password(@link)
  end

  def private_link_form
    @link = Link.find(params[:id])
  end

  def reset_ephemeral_link
    @link = find_link

    if @link.update(accessed: false)
      flash[:notice] = 'Ephemeral link has been reset and can be accessed again.'
    else
      flash[:alert] = 'Failed to reset ephemeral link.'
    end

    redirect_to link_path(@link)
  end

  def filtered_visits
    visits = @link.visits
    visits = visits.where('ip_address LIKE ?', "%#{params[:filter_ip]}%") if params[:filter_ip].present?
    visits = visits.where(accessed_at: parse_date_range) if date_range_present?
    visits.paginate(page: params[:visit_page], per_page: 5)
  end

  private

  def date_range_present?
    params[:start_date].present? && params[:end_date].present?
  end

  def parse_date_range
    start_date = params[:start_date].to_date
    end_date = params[:end_date].to_date.end_of_day
    { accessed_at: start_date..end_date }
  end

  def find_link
    @link = Link.find(params[:id])
  end

  def link_params
    params.require(:link).permit(:url, :expiration_date, :link_type, :password, :password_confirmation, :accessed)
  end
end
