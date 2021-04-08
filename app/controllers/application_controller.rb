class ApplicationController < ActionController::Base
  before_action :get_parameters_from_devise, if: :devise_controller?
  #下記のbefore_actionはここで書くと全てに影響されるから使いたい場所にのみ書こう！
  #before_action :authenticate_user!, except: :index

  private
  #deviseではemail,password, password_confirmationはデフォルトで入ってる！
  def get_parameters_from_devise
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:family_name,:second_name,:reader_family_name,:reader_second_name,:birthday])
    #devise_parameter_sanitizer.permit(:sign_in, keys: [:email,:password])
  end

end