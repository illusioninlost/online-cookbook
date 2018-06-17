class UsersController < ApplicationController

  def new
    session.delete("user_id") if session[:user_id]
    @user = User.new
  end

  def create
    if (@user = User.create(user_params)).valid?
    @user.save
    session[:user_id]=@user.id
    redirect_to recipes_path(@user)
  else
    render 'new'
    end
  end

  def login
    session.delete("user_id") if session[:user_id]
  end

  def in
    @user = User.find_by(:username => params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id]=@user.id
      redirect_to recipes_path(@user)
    else
      render 'login'
    end
  end

  def destroy
    session.delete("user_id")
    redirect_to recipes_path
  end

  def personal
    @current_user = User.find(session[:user_id]) if session[:user_id]
    redirect_to root_path if @current_user == nil
    @recipes = @current_user.recipes
  
    #@recipes.each do |recipe|
    #@comments = Recipe.find(recipe.id).comments.select('ratings')
    #end
    #binding.pry

  end

  private
    def user_params
      params.require(:user).permit(
      :username,
      :password,
      :password_confirmation
      )
    end
end
