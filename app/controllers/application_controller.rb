class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from CanCan::AccessDenied, with: :raise_not_found

  private

  def default_url_options
    {locale: I18n.locale}
  end

  def set_locale
    I18n.locale = extract_locale || I18n.default_locale
  end

  def extract_locale
    parsed_locale = params[:locale]
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ?
      parsed_locale.to_sym :
      nil
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:user_name, :email, :first_name, :last_name, :password)}

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:user_name, :email, :first_name, :last_name, :password, :current_password)}
  end

  def raise_not_found(exception = nil)
    #debugger
    #raise ActionController::RoutingError, 'Not Found'
    render 'errors/not_found', status: :not_found
  end
end
