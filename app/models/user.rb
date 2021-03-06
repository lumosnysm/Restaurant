class User < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :reviews
  has_many :orders
  before_save {email.downcase!}
  validates :name, presence: true, length: {maximum: Settings.name_max_length}
  validates :email, presence: true, length: {maximum: Settings.email_max_length},
    format: {with: Settings.valid_email_regex}, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: Settings.pass_min_length},
    allow_nil: true
  mount_uploader :image, ImageUploader
  has_secure_password
  
  def current_user? user
    self == user
  end
end
