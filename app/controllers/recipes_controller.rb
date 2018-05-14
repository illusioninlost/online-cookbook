class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    recipe = Recipe.create(recipe_params)

    redirect_to recipes_path
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
