class Role < ApplicationRecord
  has_many :staffs
  scope :lastest, ->{order salary: :desc}
  validates :name, presence: true
  validates :salary, presence: true
  validates :description, presence: true
end
