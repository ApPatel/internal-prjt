class ApplicationController < ActionController::Base
 before_filter :authenticate_user!
 rescue_from CanCan::AccessDenied do |exception|
  	    flash[:error] = exception.message
        redirect_to users_url
    

 
  end
end
