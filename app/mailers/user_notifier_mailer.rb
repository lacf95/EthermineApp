class UserNotifierMailer < ApplicationMailer
  def send_signup_email(user_id, url)
    @user = User.find(user_id)
    @url = url
    mail(to: @user.email, subject: "Welcome to Ethermine, #{@user.full_name}")
  end
end
