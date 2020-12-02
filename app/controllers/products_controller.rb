class ProductsController < ApplicationController

  def show
    @product = Product.find(params[:id])
  end
  def safety_rating
    @product = Product.find(params[:id])
    @safety_rating = Product.Find_by(safety_rating:@product.average_safety_rating_bar)
  end
  def efficacy_rating
  end
  def index
    @products = Product.all
  end
end
