class OrderItem < ApplicationRecord
  belongs_to :dish
  belongs_to :order
  delegate :name, to: :dish, prefix: :dish, allow_nil: true
  scope :search_by_dish, ->(dish_id) {where dish_id: dish_id}
  scope :search_by_order_ids, ->(order_ids) {where order_id: order_ids}
end
