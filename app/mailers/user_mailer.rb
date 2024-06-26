class UserMailer < ApplicationMailer
  default from: 'kc@example.com'

  def welcome_email(user)
    @user = user
    @url = 'http://localhost:3000/users/sign_in'
    mail(to: @user.email, subject: 'Welcome to Odinbook!')
  end
end
