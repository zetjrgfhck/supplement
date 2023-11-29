class Admin::CommentsController < ApplicationController

  def destroy
    @comment = Comment.find(params[:id])
    @review = @comment.review
    @comment.destroy
    redirect_to admin_review_path(@review)
  end

end
