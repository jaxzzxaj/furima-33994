class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :parameters_from_devise, if: :devise_controller?


  private

  # deviseではemail,password, password_confirmationはデフォルトで入ってる！
  def parameters_from_devise
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :family_name,
                                                       :second_name, :reader_family_name, :reader_second_name, :birthday])
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end
