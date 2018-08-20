class CategoriesController < ApplicationController
  before_action :load_category, only: :show

  def index
    @categories = Category.lastest
    @category = Category.new
  end

  def show
    @dish = @category.dishes.build
    @dishes = @category.dishes.lastest
    @order_item = current_order.order_items.new
  end

  private

  def load_category
    @category = Category.find_by id: params[:id]
    return if @category
    flash[:danger] = t ".not_found"
    redirect_to categories_url
  end
end
