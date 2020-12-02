class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username,:image,:email])
  	devise_parameter_sanitizer.permit(:sign_in,keys: [:login,:password,:password_confirmation])
  end
end
