class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:employee_number, :email, :first_name, :last_name, :first_name_eng, :last_name_eng, :encrypted_password, :affiliation])
  end
end
