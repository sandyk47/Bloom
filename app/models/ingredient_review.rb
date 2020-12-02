class IngredientReview < ApplicationRecord
  belongs_to :user
  belongs_to :ingredient

  validates :safety_rating, presence: true, numericality: { only_integer: true }, inclusion: { in: 0..5 }
  validates :efficacy_rating, presence: true, numericality: { only_integer: true }, inclusion: { in: 0..5 }
  validates :title, presence: true
  validates :content, presence: true
end
