class Category < ApplicationRecord
  has_many :dishes, dependent: :destroy
  scope :lastest, ->{order updated_at: :desc}
  validates :name, presence: true
end
