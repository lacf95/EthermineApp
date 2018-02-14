class UsersController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    @pool = EtherClient.new.pool
  end
end
