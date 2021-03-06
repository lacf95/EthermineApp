class User < ActiveRecord::Base
  has_secure_password
  has_attached_file :avatar, styles: { medium: '300x300>', thumb: '100x100#' }, default_url: '/images/:style/missing.png'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  has_many :addresses, dependent: :destroy
  validates :first_name, presence: true, length: { maximum: 20 }, on: :create
  validates :last_name, presence: true, length: { maximum: 20 }, on: :create
  validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: [:create, :update]}

  before_validation :new_token, on: :create

  def change_token
    update(token: generate_token)
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  private

  def new_token
    self.token = generate_token
  end

  def generate_token
    Digest::SHA256.hexdigest("#{email}#{SecureRandom.base64}")
  end
end
