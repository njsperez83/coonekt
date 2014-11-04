class ApplicationController < ActionController::Base
  include UsersHelper

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  add_flash_types :active_record

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_path, :alert => exception.message
  end

  def after_sign_up_path_for(resource)
    new_user_session_path
  end

  def after_sign_in_path_for(resource)
    users_home_path
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :email << :last_name << :first_name << :gender << :birthday
  end

end
