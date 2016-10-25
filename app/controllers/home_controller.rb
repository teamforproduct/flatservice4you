class HomeController < ApplicationController
  def index
    @user = User.new
    @user.build_car
  end
end