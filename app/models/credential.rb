require 'bcrypt'

class Credential
  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :email, :password, :user

  validates :email, :password, presence: true

  def in?
    correct_password? if registered?
  end

  private

  def registered?
    @user = User.find_by(email: email)
    errors.add(:email, 'doesn\'t match any registered user') unless @user
    @user
  end

  def correct_password?
    encrypted_pass = BCrypt::Password.create(password)
    @user = User.find_by(email: email, password: encrypted_pass)
    errors.add(:password, 'is incorrect') unless @user
    @user
  end
end
