class OrderItemsController < ApplicationController
  before_action :order_present
  
  def create
    @order = current_order
    @order_item = @order.order_items.new order_item_params
    if @order.save
      flash[:success] = "Added order items"
      session[:order_id] = @order.id
    else
      flash[:danger] = "Fail to add order items"
    end
    respond_to do |format|
      format.js
    end

  end

  def update
    @order = current_order
    @order_item = @order.order_items.find_by id: params[:id]
    @order_item.update_attributes order_item_params
    @order_items = @order.order_items
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find_by id: params[:id]
    @order_item.destroy
    @order_items = @order.order_items
    respond_to do |format|
      format.js
    end
  end

  private

  def order_present
    if  current_order.nil?
      flash[:danger] = "order nil"
    end
  end

  def order_item_params
    params.require(:order_item).permit(:quantity, :dish_id, :price_each)
  end
end
