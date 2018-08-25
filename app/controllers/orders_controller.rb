class OrdersController < ApplicationController
  before_action :logged_in_user
  before_action :load_order, only: :update

  def create
    @order = current_user.orders.new
    order_update_params
    if @order.save
      flash[:success] = t ".saved"
      session.delete :order_id
    else
      flash[:danger] = t ".not_save"
    end
    redirect_back fallback_location: root_url
  end

  def update
    if order_update_params
      flash[:success] = t ".saved"
      session.delete :order_id
      UserMailer.make_reservation(current_user).deliver_now
    else
      flash[:danger] = t ".not_save"
    end
    redirect_back fallback_location: root_url
  end

  def index
    @orders = current_user.orders.list_order.lastest
  end

  private

  def load_time
    order = params[:order]
    date = order[:input_date]
    time = order[:input_time]
    order_time = DateTime.parse("#{date} #{time}").
      strftime(t ".time_default")
  end

  def order_update_params
    @order.update_attributes time: load_time, message: params[:order][:message], status: false,
      people: params[:order][:people]
  end

  def load_order
    @order = Order.find_by id: params[:id]
    return if @order
    flash[:danger] = t ".order_not_found"
    redirect_back fallback_location: root_url
  end
end
