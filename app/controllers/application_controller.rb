class ApplicationController < ActionController::Base
  # Devise additional parameters on registration
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Pundit authorization system
  include Pundit

  # Prevent CSRF attacks by raising an exception.
  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :role
  end
end
