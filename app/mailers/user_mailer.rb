class UserMailer < ApplicationMailer
  default from: 'info@odinbook.com'

  def welcome_email(user)
    @user = user
    @url = 'http://localhost:3000/users/sign_in'
    mail(to: @user.email, subject: 'Welcome to Odinbook!')
  end

  def test_email(user)
    @user = user
    mail(to: @user.email, subject: 'Test Email')
  end
end
