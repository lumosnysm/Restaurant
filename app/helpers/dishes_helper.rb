module DishesHelper
  def find_dish id
    Dish.find_by id: id
  end

  def order_times dish
    OrderItem.search_by_dish(dish.id).search_by_order_ids(Order.confirmed.ids).count
  end

  def orders_this_month dish
    OrderItem.search_by_dish(dish.id).
      search_by_order_ids(Order.search_by_month Time.now.month).count
  end

  def orders_today dish
    OrderItem.search_by_dish(dish.id).
      search_by_order_ids(Order.search_by_day Time.now.day).count
  end
end
