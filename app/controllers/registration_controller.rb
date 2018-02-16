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

  def confirm
    @user = User.find_by(token: params[:token])
    if @user
      @user.active = true
      return render 'error' unless @user.save
      redirect_to home_index_path
    else
      render 'error'
    end
  end

  def signup_email
    user = User.find(session[:user_id])
    user.token = token(user.email)
    return render 'error' unless user.save
    send_email
    redirect_to home_index_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

  def token(email)
    Digest::SHA256.hexdigest(email + Time.now.to_i.to_s)
  end

  def send_email(token)
    "/#{token}"
  end
end
