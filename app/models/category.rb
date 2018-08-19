class Category < ApplicationRecord
  has_many :dishes
  has_many :category_picked, class_name: Menudetail.name,
    foreign_key: :category_id, dependent: :destroy
  has_many :menus, through: :category_picked, source: :menu
  scope :lastest, ->{order updated_at: :desc}
  validates :name, presence: true

  def dishes_not_pick
    dishes.not_pick
  end
end