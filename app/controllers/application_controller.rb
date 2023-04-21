# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_x_forwarded_ssl_header
  before_action :set_locale
  before_action :authenticate_admin!

  private

  def set_locale
    I18n.locale = extract_locale || I18n.default_locale
  end

  def extract_locale
    parsed_locale = params[:locale]
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  end

  def default_url_options
    { locale: I18n.locale }
  end

  def set_x_forwarded_ssl_header
    request.headers['X-Forwarded-Ssl'] = 'on'
  end
end
