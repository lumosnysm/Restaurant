module MenusHelper
  def top_order_menu menu
    OrderItem.select(:dish_id).where(dish_id: menu.dishes.ids).group(:dish_id).
      count.sort_by{|k, v| v}.reverse_each.first(Settings.top_orders)
  end
end
