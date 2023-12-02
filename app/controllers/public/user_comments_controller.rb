class Public::UserCommentsController < ApplicationController
  
  def index
    @user = User.find(params[:user_id])
    bookmarks = bookmark.where(user_id: @user.id).pluck(:review_id)
    @bookmark_reviews = Review.find(bookmark)
    @reviews = Reviews.find(params[:id])
    render "public/reviews/index"
  end
end
