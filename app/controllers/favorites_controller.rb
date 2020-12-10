class FavoritesController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    current_user.favorite(@product)
    redirect_to @product
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    current_user.unfavorite(@favorite.favoritable)
    redirect_to @favorite.favoritable
  end
end
