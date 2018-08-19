class Menu < ApplicationRecord
  has_many :picks, class_name: Menudetail.name,
    foreign_key: :menu_id, dependent: :destroy
  has_many :categories, through: :picks, source: :category
  has_many :dishes, through: :picks, source: :dish
  scope :lastest, ->{order updated_at: :desc}
  validates :name, presence: true
end
