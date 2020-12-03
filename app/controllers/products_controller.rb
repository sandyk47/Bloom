class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :safety_rating]
  def show
    @product = Product.find(params[:id])
  end



  def efficacy_rating
  end
  def index
    @products = Product.all
  end
  private

  def set_product
    @product = Product.find(params[:id])
  end
end
