class DishesController < ApplicationController
  before_action :load_dish

  def show
    @supports = Supports::Dish.new params: session
  end

  private

  def load_categories
    @categories = Category.all.collect{|category| [category.name, category.id]}
  end

  def load_dish
    @dish = Dish.find_by id: params[:id]
    return if @dish
    flash.now[:danger] = t ".not_found"
    redirect_to root_url
  end
end
