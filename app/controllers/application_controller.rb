class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, unless: :events_url
  before_action :configure_sign_up_params, if: :devise_controller?

  protected

    def configure_sign_up_params
     devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :dob, :email, :password, :password_confirmation, :mobile, :role_id])
    end

end
