class ApplicationController < ActionController::Base
  around_action :switch_locale

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale

    if (I18n.available_locales.include?(locale.to_sym))
      I18n.with_locale(locale, &action)
    else
      I18n.with_locale(I18n.default_locale, &action)
    end
  end
end
