class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items

  def calculate_total
    order_items.collect { |oi| oi.quantity * oi.price_each }.sum
  end

  private

  def update_total
    self.total = calculate_total
  end
end
