class UsersController < ApplicationController
  def index
  end

  def me
    @general_info = EthermineGeneralInfoPresenter.new
    user_addresses
  end

  def profile
    render 'show'
  end

  def edit
  end

  def update
    if @user.update(user_params)
      render @user
    else
      render 'edit'
    end
  end

  private

  def user_addresses
    @addresses = @current_user.addresses
    @addresses.map do |address|
      address.class.module_eval { attr_accessor :statistics }
      address.statistics = EtherClient.new(address.address).miner.statistics
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :avatar)
  end
end
