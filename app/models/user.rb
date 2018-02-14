class User < ActiveRecord::Base
  has_secure_password
  has_many :addresses, dependent: :destroy
  validates :first_name, presence: true, length: { maximum: 20 }, on: :create
  validates :last_name, presence: true, length: { maximum: 20 }, on: :create
  validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
end
