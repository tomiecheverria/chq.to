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
    @link = build_link_with_type(link_params)
    if @link.save
      redirect_to user_path(current_user), notice: 'Link successfully created.'
    else
      flash[:errors] = @link.errors.full_messages
      redirect_to new_link_path(@link)
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
      # render :edit consultar porque no se pueded usar 
    end
    redirect_to edit_link_path(@link)
  end

  def destroy
    @link = current_user.links.find(params[:id])
    @link.destroy
    redirect_to user_path(current_user), notice: 'Link successfully deleted.'
  end

  private

  def build_link_with_type(params)
    puts params.inspect
    link = current_user.links.build(params)
    link.link_type = link_type_from_params(params[:link_type])
    link.password_confirmation = params[:password_confirmation] if link.private_link?
    p "link #{link.link_type}"
    link
  end

  def link_type_from_params(type_param)
    type_mapping = {
      'temporary' => :temporary,
      'regular' => :regular,
      'private_link' => :private_link,
      'ephemeral' => :ephemeral
    }
    type_mapping[type_param]
  end

  def link_params
    params.require(:link).permit(:url, :expiration_date, :link_type, :password, :password_confirmation, :accessed)
  end
end
