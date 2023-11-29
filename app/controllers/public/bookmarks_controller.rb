class Public::BookmarksController < ApplicationController

  def create
    review = Review.find(params[:review_id])
    bookmark = current_user.bookmarks.new(review_id: review.id)
    bookmark.save

  end

  def destroy
    review = Review.find(params[:review_id])
    bookmark = current_user.bookmarks.new(review_id: review.id)
    bookmark.save
  end

end
