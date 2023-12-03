class LinksController < ApplicationController
  before_action :authenticate_user!

  def index
    @links = current_user.links
  end

  def new
    @link = current_user.links.build
  end

  def create
    @link = current_user.links.build(link_params)
    if @link.save
      redirect_to links_path, notice: 'Link succesfully created.'
    else
      render :new
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
    params.require(:link).permit(:name, :url)
  end
end
