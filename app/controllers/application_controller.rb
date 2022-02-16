class ApplicationController < ActionController::Base
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_items_path
    when Customer
      items_path
    end
  end
  

  def after_sign_out_path_for(resource)
    root_path
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :postal_code, :address, :telephone_number, :last_name_kana , :first_name_kana])
  end

  def after_sign_out_path_for(resource)
    root_path
  end
end
