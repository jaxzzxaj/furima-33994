class ApplicationController < ActionController::Base
  before_action :get_parameters_from_devise, if: :devise_controller?

  def get_parameters_from_devise
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:email,:encrypted_password,:family_name,:second_name,:reader_family_name,:reader_second_name,:birthday])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email,:password]
  end
end
