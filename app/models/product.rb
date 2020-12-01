class Product < ApplicationRecord
  belongs_to :brand
  has_many :ingredients, through: :product_ingredients
end
