class Ingredient < ApplicationRecord
has_many :product_ingredients
has_many :ingredient_reviews
end
