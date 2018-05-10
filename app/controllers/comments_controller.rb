class CommentsController < ApplicationController

  def new
    @recipe = Recipe.find_by(id: params[:id])
  end

  def create
    @recipe = Recipe.find_by(id: params[:id])
    @comment = @recipe.comments.create(comments_params)
    redirect_to recipe_path(@recipe)
  end


  private
  def comments_params
    params.require(:comment).permit(:name, :content, :ratings)
  end
end
