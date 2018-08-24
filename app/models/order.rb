class Order < ApplicationRecord
  attr_accessor :input_date, :input_time
  belongs_to :user
  has_many :order_items
  has_many :dishes, through: :order_items
  scope :list_order, ->{where.not status: nil}
  scope :lastest, ->{order updated_at: :desc}
  delegate :name, to: :user, prefix: :user, allow_nil: true

  def order_total_amount
    order_items.collect{|i| i.quantity * i.price_each}.sum
  end
end
