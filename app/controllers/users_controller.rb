class UsersController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    general_ethermine
    user_addresses
  end

  def profile
    render 'show'
  end

  def edit
  end

  def update
    find_user
    if @user.update(user_params)
      redirect_to profile_path
    else
      render 'edit'
    end
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
  
  def find_user
    @user = User.find(session[:user_id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :avatar)
  end
end
