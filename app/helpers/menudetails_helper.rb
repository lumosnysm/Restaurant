module MenudetailsHelper
  def dish_in_menu menu, dish
    menu.picks.find_by menu_id: menu.id, dish_id: dish.id
  end
end
