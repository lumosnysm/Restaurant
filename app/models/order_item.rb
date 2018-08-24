class OrderItem < ApplicationRecord
  belongs_to :dish
  belongs_to :order
  delegate :name, to: :dish, prefix: :dish, allow_nil: true
end
