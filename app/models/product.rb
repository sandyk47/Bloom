class Product < ApplicationRecord
  belongs_to :brand, dependent: :destroy
  has_many :product_ingredients
  has_many :ingredients, through: :product_ingredients
  has_many :product_reviews

  validates :title, presence: true, uniqueness: true

  include PgSearch::Model
  pg_search_scope :product_and_brand_search,
    against: [ :title, :description ],
    associated_against: {
      brand: [ :name, :description ]
    },
    using: {
      tsearch: { prefix: true }
    }
end
