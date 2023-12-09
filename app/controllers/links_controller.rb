class LinksController < ApplicationController
  include LinksHelper
  before_action :authenticate_user!
  before_action :find_link, only: [:show, :edit, :update, :destroy]

  def index
    @links = current_user.links
  end

  def new
    @link = build_new_link(current_user)
  end

  def create
    @link = build_link_with_type(current_user, link_params)
    save_or_redirect(@link, 'Link successfully created.', user_path(current_user), new_link_path)
  end

  def show; end

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
    password_matches?(params[:password], @link) ? redirect_to_link(@link) : handle_invalid_password(@link)
  end

  def private_link_form
    @link = Link.find(params[:id])
  end

  private

  def find_link
    @link = Link.find(params[:id])
  end

  def link_params
    params.require(:link).permit(:url, :expiration_date, :link_type, :password, :password_confirmation, :accessed)
  end
end
