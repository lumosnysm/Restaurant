class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = current_user.reviews.build review_params
    if @review.save
      flash[:success] = t ".message_success"
    else
      flash[:danger] = t ".message_danger"
    end
    redirect_to root_url
  end

  private

  def review_params
    params.require(:review).permit :content
  end
end
