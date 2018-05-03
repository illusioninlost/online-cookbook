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
