# app/controllers/users_controller.rb
class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @links = @user.links.paginate(page: params[:page], per_page: 5)
  end
end
