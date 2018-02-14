class CredentialsController < ApplicationController
  def index
    @credential = Credential.new
  end

  def create
    @credential = Credential.new(credential_params)
    if @credential.valid? && @credential.in?
      session[:user_id] = @credential.user[:id]
      render inline: "<h2>#{session[:user_id]}</h2>"
    else
      @credential.password = nil
      render 'index'
    end
  end

  private

  def credential_params
    params.require(:credential).permit(:email, :password)
  end
end
