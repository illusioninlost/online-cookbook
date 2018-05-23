class ApplicationController < ActionController::Base

  def log_in?
   !!current_user
 end

 private
   def verify?
     redirect_to root_path unless logged_in?
   end

   def current_user
     @current_user ||= User.find_by(session[:user_id]) if session[:user_id]
   end


end
