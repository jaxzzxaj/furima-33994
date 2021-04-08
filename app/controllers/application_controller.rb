class ApplicationController < ActionController::Base
  before_action :get_parameters_from_devise, if: :devise_controller?
  before_action :authenticate_user!, except: :index

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    if @user.valid?
      redirect_tp action: :index
    else
      render action: :new
    end
  end

  private

  def get_parameters_from_devise
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:email,:password_confirmation,:family_name,:second_name,:reader_family_name,:reader_second_name,:birthday])
    #devise_parameter_sanitizer.permit(:sign_in, keys: [:email,:password])
  end

  def users_params
    params.require(:users).permit(:nickname,:email,:encrypted_password,:family_name,:second_name,:reader_family_name,:reader_second_name,:birthday)
  end
end