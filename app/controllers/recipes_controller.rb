require 'pry'

class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
    @current_user = User.find(session[:user_id]) if session[:user_id]
    @say_hi = "Hi "
    if @current_user == nil
      @message = "Log in or sign up to add your own recipe"
    end
  end

  def new
    @current_user = User.find(session[:user_id]) if session[:user_id]
    @recipe = Recipe.new
    redirect_to root_path if @current_user == nil
  end

  def create
    @current_user = User.find(session[:user_id]) if session[:user_id]
    if (@recipe = Recipe.new(recipe_params)).valid?
      @current_user.recipes.create(recipe_params)
      redirect_to recipes_path
    else
      render 'new'
    end
  end

  def edit
    @current_user = User.find(session[:user_id]) if session[:user_id]
    redirect_to root_path if @current_user == nil
    @recipe = Recipe.find_by(id: params[:id])
  end

  def update
    @current_user = User.find(session[:user_id]) if session[:user_id]
    if @current_user == nil
      redirect_to root_path
    elsif @current_user.recipes.find_by(id: params[:id]) == nil
      redirect_to root_path
    else
      @current_user.recipes.find_by(id: params[:id]).update(recipe_params)
      redirect_to recipes_path
    end
  end

  def destroy
    @current_user = User.find(session[:user_id]) if session[:user_id]
    if @current_user == nil
      redirect_to root_path
    elsif @current_user.recipes.find_by(id: params[:id]) == nil
      redirect_to root_path
    else
      @current_user.recipes.find_by(id: params[:id]).destroy
      redirect_to recipes_path
    end
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
    @sum = Recipe.average_ratings(@recipe)
  end

  private
  def recipe_params
    params.require(:recipe).permit(
    :name,
    :creator,
    :notes,
    :special_tools,
    :approximate_time,
    :ingredients
    )
  end

end
