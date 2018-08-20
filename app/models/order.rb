class Order < ApplicationRecord
  attr_accessor :input_date, :input_time
  belongs_to :user
  has_many :order_items
  has_many :dishes, through: :order_items

  def total
    order_items.collect{|i| i.quantity * i.price_each}.sum
  end
end
