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
    # if @link.link_type.to_sym == :temporary && link_expired?(@link)
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
    redirect_to user_path(current_user), notice: 'Link successfully Deleted.'
  end

  def redirect
    @link = Link.find_by(slug: params[:slug])

    if @link
      handle_valid_link
    else
      handle_invalid_link
    end
  end

  private

  def handle_valid_link
    if @link.temporary? && @link.expired?
      handle_expired_link
    else
      redirect_to_link
    end
  end

  def handle_expired_link
    p "handle_expired_link called"
    flash[:alert] = 'The link has expired'
    redirect_to root_path, status: :not_found
  end

  def redirect_to_link
    p"handle_valid_link called"
    redirect_to @link.url, status: :moved_permanently, allow_other_host: true
  end

  def handle_invalid_link
    flash[:alert] = 'This link does not exist'
    redirect_back fallback_location: root_path
  end

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

  def expired?(link)
    link.expiration_date.present? && link.expiration_date < DateTime.current
  end
end
