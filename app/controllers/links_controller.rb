class LinksController < ApplicationController
  before_action :authenticate_user!
  def index
    @links = current_user.links
  end

  def new
    @link ||= current_user.links.build
  end

  def show
    @link = Link.find(params[:id])
    if @link.link_type.to_sym == :temporary && link_expired?(@link)
      redirect_to '/404'
    elsif @link.link_type.to_sym == :private_link
      render '_show_private_link'
    end
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
    flash[:notice] = 'Link successfully deleted.'
    redirect_to user_path(current_user), notice: "Link successfully deleted."
  end

  def update_password
    @link = Link.find(params[:id])
    password = params[:link][:password]

    if @link.password == password
      flash[:notice] = 'Password updated successfully.'
    else
      flash[:errors] = ['Invalid password.']
    end

    redirect_to link_path(@link)
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

  def link_expired?(link)
    link.expiration_date.present? && link.expiration_date < DateTime.current
  end
end
