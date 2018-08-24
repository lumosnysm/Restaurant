class UserMailer < ApplicationMailer
  def make_reservation user
    @user = user
    mail to: user.email, subject: t(".subject")
  end
end
