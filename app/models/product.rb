class Product < ApplicationRecord
  belongs_to :brand
  has_many :ingredients, through: :product_ingredients
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :average_product_rating_stars, presence: true, numericality: true, inclusion: { in: 0..5 }
  validates :average_safety_rating_bar, presence: true, numericality: true, inclusion: { in: 0..5 }
  validates :average_efficacy_rating_bar, presence: true, numericality: true, inclusion: { in: 0..5 }

  def safety_rating
    safety_rating = self.average_safety_rating_bar
    product_ingredients = ProductIngredient.where(product: self)

    all_ingredients_safety_rating_total = 0
    count = 0
    #product_ingredients.average(:average_safety_rating)
    product_ingredients.each do |product_ingredient|
      all_ingredients_safety_rating_total += product_ingredient.ingredient.average_safety_rating
      count += 5
    end
    product_safety_rating = (all_ingredients_safety_rating_total/count) * 100
    #loop over all the ingredints
    #add safety_rating of every single ingredint to a variable or an array/ varibale is faster
    #calculate safety_rating out of 100%
    #store the value back to the database
  end


end
