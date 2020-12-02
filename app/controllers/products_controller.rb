class ProductsController < ApplicationController
<<<<<<< HEAD
  def show
    @product = Product.find(params[:id])
  end
  def safety_rating
    @product = Product.find(params[:id])
    @safety_rating = Product.Find_by(safety_rating:@product.average_safety_rating_bar)
  end
  def efficacy_rating

=======
  def index
    @products = Product.all
>>>>>>> 4944ae0bc572d06356c95ca91d31966c081bd4c1
  end
end
