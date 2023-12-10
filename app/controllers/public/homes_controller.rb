class Public::HomesController < ApplicationController

  def top
    @reviews = Review.order(id: :desc).limit(4)
    @new_comment_reviews = Review.joins(:comments).order("comments.id", :desc).limit(4)
  end
end
