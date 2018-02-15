class RegistrationController < ApplicationController
  def index
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      UserNotifierMailer.send_signup_email(@user.id).deliver
      redirect_to home_index_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
