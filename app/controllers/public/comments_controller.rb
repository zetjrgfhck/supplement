class Public::CommentsController < ApplicationController

  def create
    @review = Review.find(params[:review_id])
    @comment = current_user.comments.new(comment_params) #コメントを保存する箱とログインしているコメントを残すユーザーの記述
    @comment.review_id = @review.id
    if @comment.save
      flash[:notice] = "success"
      redirect_to review_path(@review)
    else
      flash.now[:alert] = "failed"
      render "public/reviews/show"
    end
  end

private

  def comment_params
    params.require(:comment).permit(:content)
  end

end
