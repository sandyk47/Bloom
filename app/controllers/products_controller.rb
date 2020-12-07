class ProductsController < ApplicationController

  def index
    @products = Product.all

    @products = @products.product_and_brand_search(params[:query]) if params[:query].present?

    @products = @products.tagged_with(params[:tag]) if params[:tag].present?

    @products = @products.where(category: params[:category]) if params[:category].present?
  end

   def show
    @product = Product.find(params[:id])
    @product_review = ProductReview.new
  end

  private

  def product_params
    params.require(:product).permit(:title, :brand_id, :description, :average_product_rating_stars, :average_efficacy_rating_bar, :average_safety_rating_bar, tag_list: [])
  end
end


