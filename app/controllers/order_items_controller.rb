class OrderItemsController < ApplicationController
  before_action :logged_in_user

  def create
    @order = current_order
    @order_item = @order.order_items.new order_item_params
    if @order.dishes.ids.include? @order_item.dish.id
      flash[:success] = t ".dish_exist"
    else
      @order.user_id = current_user.id
      if @order_item.save
        flash[:success] = t ".added"
        session[:order_id] = @order.id
      else
        flash[:danger] = t ".not_added"
      end
    end
    redirect_back fallback_location: root_url
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find_by id: params[:id]
    if @order_item.update_attributes order_item_params
      flash[:success] = t ".updated"
    else
      flash[:danger] = t ".not_updated"
    end
    redirect_back fallback_location: root_url
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find_by id: params[:id]
    if @order_item.destroy
      flash[:success] = t ".deleted"
    else
      flash[:danger] = t ".not_deleted"
    end
    redirect_back fallback_location: root_url
  end

  private

  def order_item_params
    params.require(:order_item).permit(:quantity, :dish_id, :price_each)
  end
end
