class ApplicationController < ActionController::Base
  # before_action :basic_auth
  before_action :cofigure_permitted_parameters, if: :devise_controller?

  private

  # def basic_auth
  #  authenticate_or_request_with_http_basic do |username, password|
  #    username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
  #  end
  # end

  def cofigure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up, keys: [:nickname, :first_name_full_width, :last_name_full_width,
      :first_name_katakana, :last_name_katakana, :birthday ])
  end
end
