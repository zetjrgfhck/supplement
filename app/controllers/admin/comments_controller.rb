class Admin::CommentsController < ApplicationController

  def destroy
    @comment = Comment.find(params[:id])
    @review = @comment.review
    @comment.destroy
    flash[:notice] = "コメントを削除しました"
    redirect_to admin_review_path(@review)
  end
end
