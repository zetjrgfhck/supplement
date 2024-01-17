class Public::UserReviewsController < ApplicationController
  def index
    user = User.find(params[:user_id])
    @reviews = user.reviews
    render "public/reviews/index"
  end
end
