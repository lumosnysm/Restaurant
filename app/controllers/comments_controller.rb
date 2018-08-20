class CommentsController < ApplicationController
  before_action :find_dish
  before_action :find_comment, only: [:destroy]
 
  
  def create
    @comment = @dish.comments.build comment_params
    if @comment.save
      @supports = Supports::Dish.new params
      respond_to do |format|
        format.html do
          flash[:success] =  t".success"
          redirect_to dish_path @dish
        end
        format.js
      end
    else
      flash[:danger] = t".danger"
      redirect_to dish_path @dish
    end
  end

  def destroy
    if @comment.destroy
      respond_to do |format|
        format.html do
          flash[:success] =t".success"
          redirect_to dish_path @dish
        end
        format.js
      end
    else
      flash[:danger] = t".danger"
      redirect_to dish_path @dish
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge user_id: current_user.id
    
  end

  def find_comment
    @comment = Comment.find_by id: params[:id]
    if @comment.nil?
      flash[:danger] = t".danger"
      redirect_to dish_path @dish
    end
  end

  def find_dish
    @dish = Dish.find_by id: params[:dish_id]
    if @dish.nil?
      flash[:danger] = t".danger"
      redirect_to dishes_path 
    end
  end
end
