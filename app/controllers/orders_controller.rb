class OrdersController < ApplicationController
  before_action :logged_in_user

  def update
    order = params[:order]
    date = order[:input_date]
    time = order[:input_time]
    order_time = DateTime.parse("#{date} #{time}").
      strftime(t ".time_default")
    @order = Order.find_by id: params[:id]
    if @order.update_attributes time: order_time, message: order[:message], status: false
      flash[:success] = t ".saved"
      session.delete :order_id
    else
      flash[:danger] = t ".not_save"
    end
    redirect_back fallback_location: root_url
  end
end
