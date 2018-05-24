class ApplicationController < ActionController::Base


 private
   def verify_or_home?
     redirect_to root_path unless User.find_by(session[:user_id]) if session[:user_id]
   end


end
