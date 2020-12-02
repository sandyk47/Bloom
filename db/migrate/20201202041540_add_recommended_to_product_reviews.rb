class AddRecommendedToProductReviews < ActiveRecord::Migration[6.0]
  def change
    add_colum :product_reviews, :recommended, :boolean
  end
end
