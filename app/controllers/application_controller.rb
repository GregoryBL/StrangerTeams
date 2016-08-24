class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:school_key])
  end

  # def sign_up_params
  #   params.require(:teacher).permit(:first_name, :last_name, :school_key, :email, :password, :password_confirmation)
  # end

  # def account_update_params
  #   params.require(:teacher).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
  # end
end
