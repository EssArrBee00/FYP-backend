class UserMailer < ApplicationMailer
  default from: 'konnect2hammad@gmail.com'

  def registration_confirmation(usr)
    @user = usr
    mail(to: @user.email, subject: 'Registration Successfull')
  end
end
