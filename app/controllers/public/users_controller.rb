class Public::UsersController < ApplicationController

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
      if @user.update(user_params)
        flash[:notice] = "設定内容を保存しました"
        redirect_to users_my_page_path
      else
        flash.now[:notice] = "変更に失敗しました"
        render :"public/users/edit"
      end
  end

  def leave
    current_user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  def reviews
    @user = User.find(params[:id])
    @reviews = @user.reviews
  end

  def comments
    @user = User.find(params[:id])
    @reviews = @user.reviews
    @comments = @user.comments
  end

  def bookmarks
    @user = User.find(params[:id])
    @bookmarks = Bookmark.where(user_id: @user.id)#.pluck(:review_id)
    #@bookmark_reviews = Review.find(bookmarks)
    #@reviews = Review.find(params[:id])
  end



  private
    def user_params
      params.require(:user).permit(:last_name, :first_name, :email, :nickname, :birthday, :gender, :is_deleted)
    end
end
