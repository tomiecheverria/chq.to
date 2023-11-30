# app/controllers/users_controller.rb
class UsersController < ApplicationController
  def create
    @user = User.create_with_params(user_params)

    if @user.errors.empty?
      sign_in @user
      redirect_to root_path, notice: '¡Registro exitoso!'
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
