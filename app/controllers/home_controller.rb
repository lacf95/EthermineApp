class HomeController < ApplicationController
  def index
    redirect_to login_path unless User.find_by(id: session[:user_id])
  end
end
