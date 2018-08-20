module StaticPagesHelper
  def top_order_all
    OrderItem.select(:dish_id).group(:dish_id).
      count.sort_by{|k, v| v}.reverse_each.first(Settings.top_orders)
  end
end
