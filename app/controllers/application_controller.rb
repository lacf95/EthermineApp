class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :active_user 

  def active_user
    @current_user = User.find_by(id: session[:user_id]) if session[:user_id]
  end
end
