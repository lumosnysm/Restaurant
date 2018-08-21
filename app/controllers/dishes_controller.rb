class DishesController < ApplicationController
  before_action :load_dish

  def show; end

  private

  def load_dish
    @dish = Dish.find_by id: params[:id]
    return if @dish
    flash.now[:danger] = t ".message_danger"
    redirect_to root_url
  end
end
