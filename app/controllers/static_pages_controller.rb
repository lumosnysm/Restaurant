class StaticPagesController < ApplicationController
  def home
    @reviews = Review.lastest.list
    @order_item = current_order.order_items.new
  end
end
