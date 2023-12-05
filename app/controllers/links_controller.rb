class LinksController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    @links = current_user.links
  end

  def new
    @link ||= current_user.links.build
  end

  def show
    @link = Link.find_by(params[:id])
  end

  def create
    @link = current_user.links.build(link_params)
    if @link.save
      redirect_to user_path(current_user), notice: 'Link succesfully created.'
    else
      flash[:errors] = @link.errors.full_messages
      render :new
    end
  end

  def edit
    @link = current_user.links.find(params[:id])
  end

  def update
    @link = current_user.links.find(params[:id])

    if @link.update(link_params)
      flash[:notice] = 'Link successfully updated.'
    else
      flash[:errors] = @link.errors.full_messages
      # render :edit
    end
    redirect_to edit_link_path(@link)
  end

  def destroy
    @link = current_user.links.find(params[:id])
    @link.destroy
  
    respond_to do |format|
      format.html { redirect_to user_path(current_user), notice: 'Link successfully deleted.' }
      format.js
    end
  end

  private

  def link_params
    params.require(:link).permit(:url)
  end
end
