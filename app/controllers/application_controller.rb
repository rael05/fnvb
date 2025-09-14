class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from CanCan::AccessDenied, with: :raise_not_found

  def enable_change
    model = controller_name.classify.constantize
    record = model.find(params[:id])
    record.update(enabled: !record.enabled)
    respond_to do |format|
      format.html { redirect_to url_for(controller: controller_name, action: :index), notice: t("#{controller_name.singularize}_was_successfully_disabled") }
      format.json { head :no_content }
    end
  end

  def records_index(permission)
    model = controller_name.classify.constantize
    records = permission ? model.all : model.where(enabled: true)
    if params[:search].present?
      return records.with_translations(I18n.locale).where("name ILIKE ?", "%#{params[:search]}%")
    end
    return records
  end

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
