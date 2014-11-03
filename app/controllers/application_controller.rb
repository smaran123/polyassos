class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
   # layout :layout
#  def layout
#      (params[:controller] == "properties" or params[:controller] == "home" or params[:controller] == "events") ? 'application' :manager
#        
#    end
  before_filter :update_sanitized_params, if: :devise_controller?

    def update_sanitized_params
      devise_parameter_sanitizer.for(:sign_up) {|u| u.permit!}
    end
  
    
    
     def after_sign_in_path_for(resource_or_scope)
     
      if resource_or_scope.is_a?(Worker)
        workers_path
      end
    end
    
    
     def is_glogin?
      unless current_worker
        flash[:error] = "Please login."
        redirect_to "/"
      end
    end
    
    
    
    
     def banned?
      if current_worker.present? && !current_worker.is_active?
        sign_out current_worker
        flash[:error] = "This account has been suspended...."
        root_path
      end
    end
    
    
    
    
    
end
