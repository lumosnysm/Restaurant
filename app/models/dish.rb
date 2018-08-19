class Dish < ApplicationRecord
  belongs_to :category
  has_many :dish_picked, class_name: Menudetail.name,
    foreign_key: :dish_id, dependent: :destroy
  has_many :menus, through: :dish_picked, source: :menu
  scope :not_pick, ->{where.not id: Menudetail.select("dish_id")};
end
