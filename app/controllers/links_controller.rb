class LinksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @links = current_user.links
  end

  def new
    @link ||= current_user.links.build
  end

  def show
    @link = Link.find_by(slug: params[:slug])
    if @link
      redirect_to @link.url
    else
      render file: "#{Rails.root}/public/404", layout: false, status: :not_found
    end
  end

  def create
    @link = current_user.links.build(link_params)
    if @link.save
      redirect_to user_path(current_user), notice: 'Link succesfully created.'
    else
      flash[:errors] = @link.errors.full_messages
      redirect_to new_link_path
    end
  end

  def edit
    @link = current_user.links.find(params[:id])
  end

  def update
    @link = current_user.links.find(params[:id])
    if @link.update(link_params)
      redirect_to links_path, notice: 'Link successfuly updated.'
    else
      render :edit
    end
  end

  def destroy
    @link = current_user.links.find(params[:id])
    @link.destroy
    redirect_to links_path, notice: 'Link successfuly deleted.'
  end

  private

  def link_params
    params.require(:link).permit(:url)
  end

  def build_link_url(slug)
    if Rails.env.development?
      "http://127.0.0.1:3000/l/#{slug}"
    else
      "https://chq.to/l/#{slug}"
    end
  end
end
