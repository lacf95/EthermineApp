class UsersController < ApplicationController

  def me
    @general_info = EthermineGeneralInfoPresenter.new
    @addresses = EthermineAddressesPresenter.new(@current_user.addresses)
  end

  def profile
    render 'show'
  end

  def edit
  end

  def update
    if @current_user.update(user_params)
      redirect_to profile_path
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :avatar)
  end
end
