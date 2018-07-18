class CaterersController < ApplicationController

    def new
        session.delete("caterer_id") if session[:caterer_id]
        @caterer = Caterer.new
      end
    
      def create
        if (@caterer= Caterer.create(caterer_params)).valid?
        @caterer.save
        session[:caterer_id]=@caterer.id
        redirect_to recipes_path
      else
        render 'new'
        end
      end
    
      def login
        session.delete("caterer_id") if session[:caterer_id]
      end
    
      def in
        @caterer = User.find_by(:username => params[:username])
        if @caterer && @caterer.authenticate(params[:password])
          session[:caterer_id]=@caterer.id
          redirect_to recipes_path
        else
          render 'login'
        end
      end
    
      def destroy
        session.delete("caterer_id")
        redirect_to recipes_path
      end

      private
      def caterer_params
        params.require(:caterer).permit(
        :username,
        :password,
        :password_confirmation
        )
      end
    
end
