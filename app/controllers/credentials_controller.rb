class CredentialsController < ApplicationController
  def index
    @credential = Credential.new
  end

  def create
    @credential = Credential.new(credential_params)
    if @credential.valid?
      session[:user_id] = @credential.user.id
      redirect_to home_index_path
    else
      @credential.password = nil
      render 'index'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end

  private

  def credential_params
    params.require(:credential).permit(:email, :password)
  end
end
