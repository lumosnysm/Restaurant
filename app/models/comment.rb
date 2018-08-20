class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :dish
  scope :lastest, ->{order updated_at: :desc}
  validates :content, presence: true, length: {maximum: 50}
end
