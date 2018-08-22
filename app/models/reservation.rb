class Reservation < ApplicationRecord
  attr_accessor :input_date, :input_time
  belongs_to :user
  scope :lastest, ->{order updated_at: :desc}
  scope :inprogress, ->{where status: false}
end
