class AddressesController < ApplicationController
  before_action :find_address

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @address.user_id = session[:user_id]
    redirect_to home_index_path unless !@address.save
  end

  def show
    find_address
    @client = EtherClient.new(@address.address)
    @min_factory = MinerFactory.new(@client.miner)
    size
  end

  def edit
    find_address
  end

  def update
    find_address
    if @address.update(address_params)
      redirect_to @address
    else
      redirect_to 'edit'
    end
  end

  def destroy
    find_address
    redirect_to home_index_path unless !@address.destroy
  end

  private

  def find_address
    @address = Address.find(params[:id])
  end

  def address_params
    params.require(:address).permit(:address,:alias)
  end

  def size
    @history_size = @client.miner.history.count
    @blocks_size = @client.miner.blocks.count
    @rounds_size = @client.miner.rounds.count
    @payouts_size = @client.miner.payouts.count
  end
end
