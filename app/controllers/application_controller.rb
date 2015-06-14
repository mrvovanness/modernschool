class ApplicationController < ActionController::Base
  # Policy
  include Pundit

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception

  #active_admin config
  def authenticate_admin_user!
    redirect_to root_path unless current_user.has_role?(:admin)
  end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :role_ids
  end
end
