module Admin
  class OrdersController < AdminBaseController
    before_action :load_order, only: :update

    def index
      @orders = Order.list_order.lastest.page(params[:page]).per Settings.per_page
    end

    def update
      if @order.update_attributes status: true
        flash[:success] = t ".confirmed"
      else
        flash[:danger] = t ".not_confirm"
      end
      redirect_back fallback_location: admin_orders_url
    end

    private

    def order_params
      params.require(:order).permit :name, :price, :description, :image
    end

    def load_order
      @order = Order.find_by id: params[:id]
      return if @order
      flash[:danger] = t ".not_found"
      redirect_to admin_url
    end
  end
end
