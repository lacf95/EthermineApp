class HomeController < ApplicationController
  def index
    return redirect_to login_path unless User.find_by(id: session[:user_id])
    redirect_to users_path
  end
end
