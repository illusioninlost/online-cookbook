require 'pry'
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
    
      def caterer_login
        session.delete("caterer_id") if session[:caterer_id]
        render 'login'
      end
    
      def caterer_in
        @caterer = Caterer.find_by(:username => params[:username])
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

      def setup
        if session[:caterer_id]
        current_user = Caterer.find_by(id: session[:caterer_id]) 
        recipe = Recipe.find_by(id: params[:id])
        current_user.recipes.push(recipe)
        end
        redirect_to root_path
      end

      def contacts
        if session[:caterer_id]
          current_user = Caterer.find_by(id: session[:caterer_id]) 
          @recipes = current_user.recipes
        else
          redirect_to root_path
        end
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
