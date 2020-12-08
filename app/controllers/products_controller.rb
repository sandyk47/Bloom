class ProductsController < ApplicationController
PRODUCTS_PER_PAGE = 12

  def index

    @page = params.fetch(:page, 0).to_i
    @products = Product.offset(@page*PRODUCTS_PER_PAGE).limit(PRODUCTS_PER_PAGE)
    @products = @products.product_search(params[:query]) if params[:query].present?
    if params[:product_search].nil?
      @products = Product.offset(@page*PRODUCTS_PER_PAGE).limit(PRODUCTS_PER_PAGE)
    elsif params[:product_search][:tag].present? && params[:product_search]['category'].present? && params[:product_search]['brand'].present?
      @products =  Product.by_brand(params[:product_search]['brand'])
      @products =  @products.by_category(params[:product_search]['category'])
      @products =  @products.tagged_with(params[:product_search][:tag])
    elsif params[:product_search][:tag].present? && params[:product_search]['category'].present?
      @products = @products.by_category(params[:product_search]['category'])
      @products = @products.tagged_with(params[:product_search][:tag])
    elsif params[:product_search][:tag].present? && params[:product_search]['brand'].present?
      @products = @products.by_brand(params[:product_search]['brand'])
      @products = @products.tagged_with(params[:product_search][:tag])
    elsif params[:product_search]['category'].present? && params[:product_search]['brand'].present?
      @products = @products.by_brand(params[:product_search]['brand'])
      @products = @products.by_category(params[:product_search]['category'])
    elsif params[:product_search][:tag].present?
      @products = @products.tagged_with(params[:product_search][:tag])
    elsif params[:product_search]['category'].present?
      @products = @products.by_category(params[:product_search]['category'])
    elsif params[:product_search][:brand].present?
      @products = Product.by_brand(params[:product_search]['brand'])
    end
  end

  def show
    @product = Product.find(params[:id])
    @product_review = ProductReview.new
  end

  private

  def product_params
    params.require(:product).permit(:remove_tag, :title, :brand_id, :description, :average_product_rating_stars, :average_efficacy_rating_bar, :average_safety_rating_bar, tag_list: [])
  end
end


