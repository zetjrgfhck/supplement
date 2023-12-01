class Public::HomesController < ApplicationController

  def top
    @reviews = Review.page(params[:page]).per(4)
  end
end
