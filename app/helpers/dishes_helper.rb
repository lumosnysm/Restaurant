module DishesHelper
  def find_dish id
    Dish.find_by id: id
  end

  def order_times dish
    OrderItem.where(dish_id: dish.id).count
  end
end
