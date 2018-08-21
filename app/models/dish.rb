class Dish < ApplicationRecord
  belongs_to :category
  has_one :dish_picked, class_name: MenuDetail.name,
    foreign_key: :dish_id, dependent: :destroy
  has_one :menu, through: :dish_picked, source: :menu
  scope :lastest, ->{order updated_at: :desc}
  scope :not_pick, ->{where.not id: MenuDetail.select("dish_id")};
  mount_uploader :image, ImageUploader
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
end
