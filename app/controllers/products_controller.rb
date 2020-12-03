class ProductsController < ApplicationController

  def show
    @product = Product.find(params[:id])
  end
  def index
    if params[:query].present?
      @products = Product.product_and_brand_search(params[:query])
    else
      @products = Product.all
    end
  end

   def show
    @product = Product.find(params[:id])
    @product_review = ProductReview.new
  end

end
