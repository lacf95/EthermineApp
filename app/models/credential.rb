class Credential
  include ActiveModel::Model
  include ActiveModel::Callbacks

  attr_accessor :email, :password, :user

  validates :email, :password, presence: true
  validate :user_exists, :correct_password

  def initialize(attributes = {})
    super
    @user = User.find_by(email: attributes[:email])
  end

  private

  def user_exists
    errors.add(:email, 'doesn\'t match any registered user') unless @user
  end

  def correct_password
    return unless @user
    is_correct = @user.authenticate(password)
    errors.add(:password, 'is incorrect') unless is_correct
  end
end
