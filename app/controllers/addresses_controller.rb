class AddressesController < ApplicationController
  before_action :find_address, except: [:new, :create]

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @address.user_id = session[:user_id]
    if @address.save
      flash[:notice] = 'The address was succesfully created'
      redirect_to home_index_path
    else
      flash[:error] = @address.errors.full_messages.to_sentence
      redirect_to new_address_path
    end
  end

  def show
    client = EtherClient.new(@address.address)
    @min_factory = MinerFactory.new(client.miner)
    miner_information
  end

  def edit; end

  def update
    if @address.update(address_params)
      flash[:notice] = 'The address was succesfully updated'
      redirect_to @address
    else
      flash[:error] = @address.errors.full_messages.to_sentence
      redirect_to edit_address_path @address
    end
  end

  def destroy
    if @address
      @address.destroy
      flash[:notice] = 'The address was succesfully deleted'
      redirect_to home_index_path
    else
      redirect_to home_index_path
    end
  end

  private

  def find_address
    @address = Address.find_by(id: params[:id])
  end

  def address_params
    params.require(:address).permit(:address, :alias)
  end

  def miner_information
    @settings = @min_factory.settings
    @statistics = @min_factory.statistics
    @histories = @min_factory.histories
    @rounds = @min_factory.rounds
    @payouts = @min_factory.payouts
  end
end
