class CredentialsController < ApplicationController
  def create
    @credential = Credential.new(credential_params)
    if @credential.valid? && @credential.in?
      session[:user_id] = @credential.user[:user_id]
      render inline: "<h2>#{session[:user_id]}</h2>"
    else
      @credential.password = nil
      render 'home/index'
    end
  end

  private

  def credential_params
    params.require(:credential).permit(:email, :password)
  end
end
