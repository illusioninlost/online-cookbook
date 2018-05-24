class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
    @current_user = User.find(session[:user_id]) if session[:user_id]
    if @current_user == nil
      @message = "Log in or sign up to add your own recipe"
    end
  end

  def new
    @recipe = Recipe.new

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
    @recipe = Recipe.find_by(id: params[:id])
  end

  def update
    recipe = Recipe.find_by(id: params[:id])
    recipe.update(recipe_params)
    redirect_to recipes_path
  end

  def destroy
    recipe = Recipe.find_by(id: params[:id])
    recipe.destroy
    redirect_to recipes_path
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
    if @recipe.comments.empty?
      @sum = 5
    else
      @sum = @recipe.comments.average(:ratings).round(2)
    end
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
