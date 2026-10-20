class UserMailer < ApplicationMailer
  default from: 'info@fnvb.com'

  def change_password_mail
    @user = params[:user]
    @password = params[:password]
    mail(to: @user.email, subject: I18n.t("ui.password_change_subject"))
  end

  def user_by_president
    @user = params[:user]
    @password = params[:password]
    mail(to: @user.email, subject: I18n.t("ui.account_credentials_subject"))
  end
end
