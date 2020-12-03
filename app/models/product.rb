class Product < ApplicationRecord
  belongs_to :brand
  has_many :ingredients, through: :product_ingredients
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :average_product_rating_stars, presence: true, numericality: true, inclusion: { in: 0..5 }
  validates :average_safety_rating_bar, presence: true, numericality: true, inclusion: { in: 0..5 }
  validates :average_efficacy_rating_bar, presence: true, numericality: true, inclusion: { in: 0..5 }

  def safety_rating
    product_ingredients = ProductIngredient.where(product: self)

    all_ingredients_safety_rating_total = []
    count = 0
    product_ingredients.each do |product_ingredient|
      all_ingredients_safety_rating_total << product_ingredient.ingredient.average_safety_rating
      count += 10
    end
    product_safety_rating = (all_ingredients_safety_rating_total.sum.fdiv(count)) * 100
  end

 def efficacy_rating
    product_ingredients = ProductIngredient.where(product: self)
    all_ingredients_efficacy_rating_total = []
    count = 0
    product_ingredients.each do |product_ingredient|
    all_ingredients_efficacy_rating_total << product_ingredient.ingredient.average_efficacy_rating
      count += 10
    end
    product_efficacy_rating = (all_ingredients_efficacy_rating_total.sum.fdiv(count)) * 100
  end

end
