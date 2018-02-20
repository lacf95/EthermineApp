class RegistrationController < ApplicationController
  def index
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    return render 'index' unless @user.save
    send_email
    session[:user_id] = @user.id
    redirect_to home_index_path
  end

  def confirm
    user = User.find_by(token: params[:token])
    return render 'layouts/error' unless user
    user.active = true
    return render 'layouts/error' unless user.save
    redirect_to home_index_path
  end

  def signup_email
    @user = User.find(session[:user_id])
    return render 'layouts/error' unless @user.change_token
    send_email
    redirect_to home_index_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

  def send_email
    UserNotifierMailer.send_signup_email(@user.id, confirm_url(@user.token)).deliver
  end
end
