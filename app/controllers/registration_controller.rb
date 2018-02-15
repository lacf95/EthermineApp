class RegistrationController < ApplicationController
  def index
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    return render 'index' unless @user.save
    credential = Credential.new(email: @user.email, password: @user.password)
    session[:user_id] = credential.user[:id] if credential.in?
    redirect_to home_index_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
