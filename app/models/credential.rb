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
    is_correct = @user.authenticate(password)
    errors.add(:password, 'is incorrect') unless is_correct
    is_correct
  end
end
