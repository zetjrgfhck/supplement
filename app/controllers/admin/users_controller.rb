class Admin::UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
      if @user.update(user_params)
        flash[:notice] = "設定内容を保存しました"
        redirect_to admin_user_path(@user.id)
      else
        flash.now[:alert] = "変更に失敗しました"
        render :"admin/users/edit"
      end
  end

  private
    def user_params
      params.require(:user).permit(:last_name, :first_name, :email, :nickname, :birthday, :gender)
    end
end
