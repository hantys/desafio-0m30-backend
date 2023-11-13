class CitizenMailer < ApplicationMailer
  default from: 'thegamestudio10@gmail.com' # Substitua pelo seu endereço de e-mail

  def info_email(citizen, body)
    @citizen = citizen
    @body = body
    mail(to: @citizen.email, subject: 'Notificação do aplicativo')
  end
end
