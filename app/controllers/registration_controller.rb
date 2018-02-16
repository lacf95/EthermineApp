class RegistrationController < ApplicationController
  def index
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.new_token
    return render 'index' unless @user.save
    session[:user_id] = @user.id
    redirect_to home_index_path
  end

  def confirm
    user = User.find_by(token: params[:token])
    return render 'error' unless user
    user.active = true
    return render 'error' unless user.save
    redirect_to home_index_path
  end

  def signup_email
    user = User.find(session[:user_id])
    return render 'error' unless user.change_token
    send_email(user.token)
    redirect_to home_index_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

  def send_email(token)
    "/#{token}"
  end
end
