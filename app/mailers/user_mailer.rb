class UserMailer < ApplicationMailer
  default from: 'info@fnvb.com'

  def change_password_mail
    @user = params[:user]
    @password = params[:password]
    mail(to: @user.email, subject: 'La FNVB Acaba de cambiar tu contraseña')
  end

  def user_by_president
    @user = params[:user]
    @password = params[:password]
    mail(to: @user.email, subject: 'Bienvenido a FNVB Aqui tus nuevas credenciales')
  end
end
