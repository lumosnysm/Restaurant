class Dish < ApplicationRecord
  belongs_to :category
  validates :category_id, presence: true
  scope :lastest, ->{order updated_at: :desc}
end
