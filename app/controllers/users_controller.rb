class UsersController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    general_ethermine
  end

  def general_ethermine
    ether = EtherClient.new
    stats = ether.pool.statistics
    @pool_stats = stats.pool_stats
    @price = stats.price
    @network = ether.pool.network
  end
end
