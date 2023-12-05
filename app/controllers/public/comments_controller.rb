class Public::CommentsController < ApplicationController

  def create
    @review = Review.find(params[:review_id])
    @comment = current_user.comments.new(comment_params) #コメントを保存する箱とログインしているコメントを残すユーザーの記述
    @comment.review_id = @review.id
    if @comment.save
      flash[:notice] = "コメント投稿しました"
      redirect_to review_path(@review)
    else
      flash.now[:alert] = "投稿に失敗しました"
      render "public/reviews/show"
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    flash[:notice] = "コメントを削除しました"
    redirect_to review_path(params[:review_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

end
