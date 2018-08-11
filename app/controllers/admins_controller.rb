class AdminsController < ApplicationController
  before_action :logged_in_user, :admin_user
  
  def home
    @categories = Category.all.lastest
    @dishes = Dish.all.lastest
    @category = Category.new
    @dish = Dish.new
  end
end
