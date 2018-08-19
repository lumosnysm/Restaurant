class Menudetail < ApplicationRecord
  belongs_to :category
  belongs_to :dish
  belongs_to :menu
end
