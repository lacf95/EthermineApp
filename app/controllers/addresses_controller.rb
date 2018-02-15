class AddressesController < ApplicationController
  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @address.user_id = session[:user_id]
    if @address.save
      redirect_to home_index_path
    end
  end

  def show
    @address = Address.find(params[:id])
  end

  def edit
    @address = Address.find(params[:id])
  end
  
  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to @address
    else
      redirect_to 'edit'
    end
  end

  def destroy
    @address = Address.find(params[:id])
    if @address.destroy
      redirect_to home_index_path
    end
  end

  private

  def address_params
    params.require(:address).permit(:address,:alias)
  end
end

