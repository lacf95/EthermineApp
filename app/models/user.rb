class User < ActiveRecord::Base
  has_secure_password
  validates :first_name, presence: true, length: { maximum: 20 }, on: :create
  validates :last_name, presence: true, length: { maximum: 20 }, on: :create
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :password, presence: true, confirmation: true, length: { within: 6..8 }, on: :create
end
