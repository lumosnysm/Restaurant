class DishesController < ApplicationController
  before_action :load_dish

  def show
    @comment = Comment.new
    @order_item = current_order.order_items.new
  end

  private

  def load_dish
    @dish = Dish.find_by id: params[:id]
    return if @dish
    flash.now[:danger] = t ".message_danger"
    redirect_to root_url
  end

  def dish_params
    params.require(:dish).permit :name, :price, :description, :image
  end
end
