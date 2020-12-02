class Ingredient < ApplicationRecord
  has_many :product_ingredients
  has_many :ingredient_reviews

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :average_safety_rating, presence: true, numericality: true, inclusion: { in: 0..5 }
  validates :average_efficacy_rating, presence: true, numericality: true, inclusion: { in: 0..5 }
end
