class Review < ApplicationRecord
  belongs_to :user
  scope :lastest, ->{order created_at: :desc}
  scope :list, ->{limit Settings.review_limit}
end
