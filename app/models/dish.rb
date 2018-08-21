class Dish < ApplicationRecord
  belongs_to :category
  scope :lastest, ->{order updated_at: :desc}
  mount_uploader :image, ImageUploader
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
end
