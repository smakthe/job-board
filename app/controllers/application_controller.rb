class ApplicationController < ActionController::Base
	devise_group :user, contains: [:recruiter,:job_seeker]
	before_action :configure_permitted_parameters, if: :devise_controller?

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :resume, :company_name, :contact_number])
		devise_parameter_sanitizer.permit(:account_update, keys: [:name, :resume, :company_name, :contact_number])
	end
end
