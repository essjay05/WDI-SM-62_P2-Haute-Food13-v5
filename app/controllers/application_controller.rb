class ApplicationController < ActionController::Base

     # Add flash types for bootstrap...
     add_flash_types :danger, :info, :warning, :success
     #Make the below methods available in our templates/views
     helper_method :current_user, :logged_in?
 
     def current_user
         @current_user ||= User.find(session[:user_id]) if session[:user_id]
     end
 
     def logged_in?
         !!current_user
     end
 
     def authorize
         redirect_to new_session_path unless logged_in?
     end

end
