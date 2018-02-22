class HomeController < ApplicationController
  def index
    return redirect_to login_path unless @current_user
    redirect_to me_users_path
  end
end
