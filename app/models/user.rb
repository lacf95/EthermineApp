class User < ActiveRecord::Base
  has_secure_password
  has_many :addresses, dependent: :destroy
  validates :first_name, presence: true, length: { maximum: 20 }, on: :create
  validates :last_name, presence: true, length: { maximum: 20 }, on: :create
  validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

  def change_token
    update(token: generate_token)
  end

  def new_token
    write_attribute(:token, generate_token)
  end

  private

  def generate_token
    Digest::SHA256.hexdigest(email + Time.now.to_i.to_s)
  end
end
