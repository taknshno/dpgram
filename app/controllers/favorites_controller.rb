class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(picture_id: params[:picture_id])
    flash[:success] = "#{favorite.picture.user.name}さんの画像をお気に入り登録しました"
    redirect_to request.referer
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    flash[:success] = "#{favorite.picture.user.name}さんの画像をお気に入り解除しました"
    redirect_to request.referer
  end
end
