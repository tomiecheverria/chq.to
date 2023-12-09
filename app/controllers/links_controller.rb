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
    end
    redirect_to edit_link_path(@link)
  end

  def destroy
    @link = current_user.links.find(params[:id])
    @link.destroy
    flash[:notice] = 'Link successfully deleted.'
    redirect_to user_path(current_user), notice: 'Link successfully created.'
  end

  def redirect
    @link = Link.find_by(slug: params[:slug])

    if @link
      handle_valid_link
    else
      handle_invalid_link
    end
  end

  def handle_private_link_form
    @link = Link.find(params[:id])
    if password_matches?
      redirect_to_link
    else
      flash[:alert] = 'Invalid password'
      redirect_to private_link_form_link_path(id: @link.id) , data: { turbo: false }
    end
  end

  def private_link_form
    p "paso por private_link_form"
    @link = Link.find(params[:id])
  end

  private

  def handle_valid_link
    if @link.temporary? && @link.expired?
      handle_expired_link
    elsif @link.custom_private_link?
      redirect_to private_link_form_link_path(id: @link.id) , data: { turbo: false }
    else
      redirect_to_link
    end
  end

  def password_matches?
    return false unless params[:password].present?
  
    params[:password] == @link.password
  end

  def handle_expired_link
    flash[:alert] = 'The link has expired'
    render 'errors/not_found', status: :not_found
  end

  def redirect_to_link
    redirect_to @link.url, status: :moved_permanently, allow_other_host: true
  end

  def handle_invalid_link
    flash[:alert] = 'This link does not exist'
    redirect_back fallback_location: root_path
  end

  def build_link_with_type(params)
    link = current_user.links.build(params)
    link.link_type = link_type_from_params(params[:link_type])
    link.password_confirmation = params[:password_confirmation] if link.private_link?
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
