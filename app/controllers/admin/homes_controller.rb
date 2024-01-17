class Admin::HomesController < ApplicationController

  def top
    @reviews = Review.order(id: :desc).limit(4)
    @new_comment_reviews = Review.joins(:comments).order("comments.id desc").limit(4) #４件のみ新着レビュー表示
  end
end
