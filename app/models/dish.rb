class Dish < ApplicationRecord
  belongs_to :category
  has_many :order_items, dependent: :destroy
  has_many :dish_picked, class_name: MenuDetail.name,
    foreign_key: :dish_id, dependent: :destroy
  has_many :menu, through: :dish_picked, source: :menu
  has_many :comments, dependent: :destroy
  scope :lastest, ->{order updated_at: :desc}
  scope :not_pick, ->(dish_ids) {where.not id: dish_ids}
  scope :search_by_name, ->(name) {where "name LIKE ?", "%#{name}%"}
  scope :search_by_ids, ->(ids) {where id: ids}
  mount_uploader :image, ImageUploader
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
end
