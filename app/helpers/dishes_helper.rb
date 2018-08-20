module DishesHelper
  def find_dish id
    Dish.find_by id: id
  end
end
