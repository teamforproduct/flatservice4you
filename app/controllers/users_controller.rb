class UsersController < ApplicationController
  def create
    @user = User.create(user_params)

    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :surname, :email, car_attributes: [:id, :make, :model, :engine, :registration_no, :vin,
                                                                           :actual_mileage, :yearly_mileage, :driving_profile])
  end
end