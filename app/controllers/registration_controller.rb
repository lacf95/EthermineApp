class RegistrationController < ApplicationController
  def index
    @registration = User.new
  end

  def create
    binding.pry
    @user = User.new(user_params)
    if @user.save
      redirect_to home_index_path
    end
  end

  private

  def user_params
    params.require(:registration).permit(:first_name, :last_name, :email, :password)
  end
end
