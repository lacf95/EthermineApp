class RegistrationController < ApplicationController
  def index
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.token = token(@user.email)
    return render 'index' unless @user.save
    session[:user_id] = @user.id
    redirect_to home_index_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

  def token(email)
    BCrypt::Password.create(email + Time.now.to_i.to_s)
  end
end
