class Public::ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def index
    @reviews = Review.all
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to review_path(@review.id)
    else
      render :new
    end
  end

  def show
    @review = Review.find(params[:id])
    @comment = Comment.new
  end

private

  def review_params
    params.require(:review).permit(:title, :content, :image)
  end
end
