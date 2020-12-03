class Ingredient < ApplicationRecord
  has_many :product_ingredients
  has_many :ingredient_reviews

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :average_safety_rating, presence: true, numericality: true, inclusion: { in: 0..10 }
  validates :average_efficacy_rating, presence: true, numericality: true, inclusion: { in: 0..10 }

  include PgSearch::Model
  pg_search_scope :search_by_name_and_description,
    against: [ :name, :description ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

end
