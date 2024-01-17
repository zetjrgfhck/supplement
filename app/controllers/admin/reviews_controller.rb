class Admin::ReviewsController < ApplicationController

  def index
    keyword = params[:keyword]
    order_by = params[:order_by] # ASC or DESC
    if order_by == "ASC"
      @reviews = Review.where("title LIKE ?", "%#{keyword}%").order(created_at: :asc).page(params[:page])
    elsif order_by == "BOOKMARK"
      @reviews = Review.includes(:bookmarks).sort {|a,b| b.bookmarks.size <=> a.bookmarks.size}
      @reviews = Kaminari.paginate_array(@reviews).page(params[:page])
    elsif order_by == "COMMENT"
      @reviews = Review.includes(:comments).sort {|a,b| b.comments.size <=> a.comments.size}
      @reviews = Kaminari.paginate_array(@reviews).page(params[:page])
    else
      @reviews = Review.where("title LIKE ?", "%#{keyword}%").order(created_at: :desc).page(params[:page])
    end
    #@reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @review = Review.find(params[:id])
    @comment = Comment.new
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to admin_reviews_path
  end

  private

  def review_params
    params.require(:review).permit(:title, :content, images: [])
  end

end
