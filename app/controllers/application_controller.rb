class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :show_user_name

  def show_user_name
    return nil unless user = User.find_by(id: session[:user_id])
    user.first_name
  end
end
