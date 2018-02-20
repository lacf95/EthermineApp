class AddressesController < ApplicationController
  before_action :find_address, except: [:new, :create]

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @address.user_id = session[:user_id]
    redirect_to home_index_path unless !@address.save
  end

  def show
    client = EtherClient.new(@address.address)
    @min_factory = MinerFactory.new(client.miner)
  end

  def edit
  end

  def update
    if @address.update(address_params)
      redirect_to @address
    else
      redirect_to 'edit'
    end
  end

  def destroy
    redirect_to home_index_path unless !@address.destroy
  end

  private

  def find_address
    @address = Address.find(params[:id])
  end

  def address_params
    params.require(:address).permit(:address, :alias)
  end
end
