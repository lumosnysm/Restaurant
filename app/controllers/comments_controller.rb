class CommentsController < ApplicationController
  before_action :find_dish
  before_action :find_comment, only: :destroy
 
  def create
    @comment = @dish.comments.build comment_params
    if @comment.save
      respond_to do |format|
        flash[:success] =  t ".success"
        format.js
      end
    else
      flash[:danger] = t ".danger"
      redirect_to dish_path @dish
    end
  end

  def destroy
    if @comment.destroy
      respond_to do |format|
        flash[:success] =t ".success"
        format.js
      end
    else
      flash[:danger] = t ".danger"
      redirect_to dish_path @dish
    end
  end

  private
  
  def comment_params
    params.require(:comment).permit(:content).merge user_id: current_user.id
  end

  def find_comment
    @comment = Comment.find_by id: params[:id]
    return if @comment
    flash[:danger] = t".danger"
    redirect_to dish_path @dish
  end

  def find_dish
    @dish = Dish.find_by id: params[:dish_id]
    return if @dish
    flash[:danger] = t".danger"
    redirect_to dishes_path 
  end
end
