class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # avant toute action de devise
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected

  def configure_permitted_parameters
    # permet d'autoriser un nouveau params pour devise
    devise_permitted_sanitizer.permit(:sign_up, key: [:fullname])
    devise_permitted_sanitizer.permit(:account_update, key: [:fullname])
  end

end
