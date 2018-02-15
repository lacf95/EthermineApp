class UserNotifierMailer < ApplicationMailer
  def send_signup_email(user_id)
    @user = User.find(user_id)
    mail(to: @user.email, subject: 'Hello Anon :^) , welcome')
  end
end
