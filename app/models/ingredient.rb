class Ingredient < ApplicationRecord
  has_many :product_ingredients
  has_many :ingredient_reviews

  validates :name, presence: true, uniqueness: true

  include PgSearch::Model
  pg_search_scope :search_by_name_and_description,
    against: [ :name, :description ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

end
