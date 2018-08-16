class Category < ApplicationRecord
  scope :lastest, ->{order updated_at: :desc}
  validates :name, presence: true
end
