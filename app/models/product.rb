class Product < ApplicationRecord
  belongs_to :brand
  has_many :ingredients, through: :product_ingredients

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :average_product_rating_stars, presence: true, numericality: true, inclusion: { in: 0..5 }
  validates :average_safety_rating_bar, presence: true, numericality: true, inclusion: { in: 0..5 }
  validates :average_efficacy_rating_bar, presence: true, numericality: true, inclusion: { in: 0..5 }

  include PgSearch::Model
  pg_search_scope :search_by_name,
    against: [ :name ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
