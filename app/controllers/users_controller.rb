class UsersController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    general_ethermine
    user_addresses
  end

  private

  def general_ethermine
    ether = EtherClient.new
    stats = ether.pool.statistics
    @pool_stats = stats.pool_stats
    @price = stats.price
    @network = ether.pool.network
  end

  def user_addresses
    @addresses = @user.addresses
    @addresses.map do |a|
      a.class.module_eval { attr_accessor :statistics }
      a.statistics = EtherClient.new(a.address).miner.statistics
    end
  end
end
