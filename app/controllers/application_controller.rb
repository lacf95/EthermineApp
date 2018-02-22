class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :find_user_from_session

  def find_user_from_session
    @current_user = User.find_by(id: session[:user_id]) if session[:user_id]
  end
end
