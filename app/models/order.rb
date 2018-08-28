class Order < ApplicationRecord
  attr_accessor :input_date, :input_time
  belongs_to :user
  has_many :order_items
  has_many :dishes, through: :order_items
  scope :list_order, ->{where.not status: nil}
  scope :lastest, ->{order updated_at: :desc}
  scope :search_by_day, ->(day) {where("extract(day from time) = ?", day)}
  scope :search_by_month, ->(month) {where("extract(month from time) = ?", month)}
  delegate :name, to: :user, prefix: :user, allow_nil: true

  def order_total_amount
    order_items.collect{|i| i.quantity * i.price_each}.sum
  end
  
  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |order|
        csv << order.attributes.values_at(*column_names)
      end
    end
  end
end
