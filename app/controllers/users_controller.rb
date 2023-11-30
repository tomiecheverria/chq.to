# app/controllers/users_controller.rb
class UsersController < Clearance::UsersController
  def create
    @user = user_from_params

    if @user.save
      sign_in @user
      redirect_to root_path, notice: '¡Successfully registrated!'
    else
      flash[:alert] = 'Error registrating user.'
      p @user.errors.full_messages
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end