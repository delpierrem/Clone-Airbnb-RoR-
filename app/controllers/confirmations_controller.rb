class ConfirmationsController < Devise::ConfirmationsController

  Private
  
  def after_confirmation_path_for(resource_name, resource)
    edit_user_registration_path
  end

end
