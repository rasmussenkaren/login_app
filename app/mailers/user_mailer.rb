class UserMailer < ApplicationMailer
  default from: "mail@example.com"

  def verification_email(user)
    @user = user
    @verification_url = verification_url + "/?email=#{@user.email}"

    mail(to: @user.email, subject: 'Verificación de correo electrónico')
  end
end
