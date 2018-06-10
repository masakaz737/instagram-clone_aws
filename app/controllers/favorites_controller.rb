class FavoritesController < ApplicationController

  def create
    favorite = current_user.favorites.create(post_id: params[:post_id])
    redirect_to post_path(params[:post_id]), notice: "#{favorite.post.user.name}さんの投稿をお気に入り登録しました"
  end

  def destroy
    post_id = Favorite.find_by(params[:post_id]).post_id
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to post_path(post_id), notice: "#{favorite.post.user.name}さんの投稿をお気に入り解除しました"
  end
end
