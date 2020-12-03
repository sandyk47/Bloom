class ProductsController < ApplicationController
  def index
    if params[:query].present?
      @products = Product.product_and_brand_search(params[:query])
    else
      @products = Product.all
    end
  end
end
