class ProductsController < ApplicationController
PRODUCTS_PER_PAGE = 12

  def index
    @page = params.fetch(:page, 0).to_i
    @products = Product.offset(@page*PRODUCTS_PER_PAGE).limit(PRODUCTS_PER_PAGE)
    @products = @products.product_search(params[:query]) if params[:query].present?
    @products = @products.tagged_with(params[:tag]) if params[:tag].present?
    @products = @products.where(category: params[:category]) if params[:category].present?
    @products = @products.where(brand_id: params[:brand_id]) if params[:brand_id].present?
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


