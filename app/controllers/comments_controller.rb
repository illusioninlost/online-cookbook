require 'pry'
class CommentsController < ApplicationController

  def new
    @recipe = Recipe.find_by(id: params[:recipe_id])
    @comment = Comment.new
  end

  def create
   
    if session[:user_id]
    current_user = User.find_by(id: session[:user_id]) 
    end
    @recipe = Recipe.find_by(id: params[:recipe_id])
    if current_user === nil
      @comment = @recipe.comments.create(comments_params)
      @comment.save
      redirect_to recipe_path(@recipe)
    elsif (@comment = @recipe.comments.create(comments_params)).valid?
      @comment.save
      current_user.comments.create(comments_params)
    redirect_to recipe_path(@recipe)
    else
      render 'new'
    end
  end

  def show
    @comment = Comment.find_by(id: params[:id])
  end


  private
  def comments_params
    params.require(:comment).permit(:name, :content, :ratings)
  end

end
