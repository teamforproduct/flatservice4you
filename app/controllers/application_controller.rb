class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale

  def set_locale
    I18n.locale = extract_locale
  end

  def extract_locale
    case
      when params[:locale]
        locale = params[:locale] if I18n.available_locales.include?(params[:locale])
      when parsed_locale = request.host.split('.').last
        locale = parsed_locale if I18n.available_locales.map(&:to_s).include?(parsed_locale)
    end

    locale || I18n.default_locale
  end
end
