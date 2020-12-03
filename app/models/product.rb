class Product < ApplicationRecord
  belongs_to :brand
  has_many :ingredients, through: :product_ingredients
  has_many :product_reviews

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :average_product_rating_stars, presence: true, numericality: true, inclusion: { in: 0..5 }
  validates :average_safety_rating_bar, presence: true, numericality: true, inclusion: { in: 0..5 }
  validates :average_efficacy_rating_bar, presence: true, numericality: true, inclusion: { in: 0..5 }
end
