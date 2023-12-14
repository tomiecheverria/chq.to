class LinksController < ApplicationController
  include LinksHelper
  include WillPaginate::CollectionMethods
  before_action :authenticate_user!, only: %i[index new create show edit update destroy reset_ephemeral_link]
  before_action :find_link, only: %i[show edit update destroy]
  before_action :find_and_authorize_link, only: %i[show edit update destroy reset_ephemeral_link]

  def index
    @links = current_user.links.paginate(page: params[:page], per_page: 5)
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
    @q = @link.visits.ransack(params[:q])
    @visits = @q.result.paginate(page: params[:visit_page], per_page: 5)
  end
  

  private

  def find_link
    @link = Link.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'Link not found.'
    redirect_to root_path
  end

  def link_params
    params.require(:link).permit(:url, :expiration_date, :link_type, :password, :password_confirmation, :accessed,
                                 :name)
  end

  def find_and_authorize_link
    @link = Link.find(params[:id])
    return if current_user == @link.user

    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_to root_path
  end
end
