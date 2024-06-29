# app/controllers/users/registrations_controller.rb
class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  def create
    super do |resource|
      Rails.logger.debug "Sending welcome email to #{resource.email}"
      UserMailer.welcome_email(resource).deliver_later if resource.persisted?
    end
  end

  protected

  # Permit the username parameter along with the default Devise parameters
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :avatar_url])
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :avatar_url])
  end
end
