class Public::ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def index
    keyword = params[:keyword]
    order_by = params[:order_by] # ASC or DESC
    if order_by == "ASC"
      @reviews = Review.where("title LIKE ?", "%#{keyword}%").order(created_at: :asc)
    elsif order_by == "BOOKMARK"
      @reviews = Review.includes(:bookmarks).sort {|a,b| b.bookmarks.size <=> a.bookmarks.size}
    elsif order_by == "COMMENT"
      @reviews = Review.includes(:comments).sort {|a,b| b.comments.size <=> a.comments.size}
    else
      @reviews = Review.where("title LIKE ?", "%#{keyword}%").order(created_at: :desc)
    end
    # @reviews = Review.all
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to review_path(@review.id)
    else
      render :new
    end
  end

  def show
    @review = Review.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = "変更を保存しました"
      redirect_to review_path(@review.id)
    else
      flash[:alert] = "変更に失敗しました"
      render :"public/reviews/edit"
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to reviews_path
  end


private

  def review_params
    params.require(:review).permit(:title, :content, :keyword, images: [])
  end
end
