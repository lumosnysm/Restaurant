class MenuDetail < ApplicationRecord
  belongs_to :menu
  belongs_to :dish
  belongs_to :category
end
