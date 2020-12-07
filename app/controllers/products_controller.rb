class ProductsController < ApplicationController
  before_action :set_product
  def index
    if params[:query].present?
      @products = Product.product_and_brand_search(params[:query])
    elsif params[:tag].present?
      @products = Product.tagged_with(params[:tag])
    else
      @products = Product.all
    end
  end

   def show
    @product_review = ProductReview.new
    @product_ingredients = ProductIngredient.where(product: @product)
  end
  def favorite
    @user = current_user
    @user.favorite(@product)
    redirect_to @product
  end

  def unfavorite
    @user = current_user
    @user.unfavorite(@product)
    redirect_to @product
  end

  private
  #Using callback to set same product
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :brand_id, :description, :average_product_rating_stars, :average_efficacy_rating_bar, :average_safety_rating_bar, tag_list: [])
  end
end


