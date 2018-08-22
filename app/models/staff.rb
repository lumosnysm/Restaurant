class Staff < ApplicationRecord
  belongs_to :role
  scope :lastest, ->{order role_id: :desc}
  scope :role_staffs, ->(role){where role_id: role}
  validates :name, presence: true, length: {maximum: Settings.name_max_length}
  validates :email, presence: true, length: {maximum: Settings.email_max_length},
    format: {with: Settings.valid_email_regex}, uniqueness: {case_sensitive: false}
  validates :address, presence: true
  delegate :name, :to => :role, :allow_nil => true, prefix: true

end
