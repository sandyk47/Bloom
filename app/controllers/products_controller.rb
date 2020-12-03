class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

   def show
    @product = Product.find(params[:id])
    @product_review = ProductReview.new
  end

end
