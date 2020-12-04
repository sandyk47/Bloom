class Product < ApplicationRecord
  acts_as_taggable_on :tags
  acts_as_taggable_on :conditions
  acts_as_taggable_on :ingredient_preferences
  acts_as_taggable_on :skin_concerns
  acts_as_taggable_on :skin_types
  acts_as_taggable_on :accreditations

  belongs_to :brand
  has_many :product_ingredients
  has_many :ingredients, through: :product_ingredients
  has_many :product_reviews

  validates :title, presence: true, uniqueness: true

  def safety_rating
    product_ingredients = ProductIngredient.where(product: self)

    all_ingredients_safety_rating_total = []
    count = 0
    product_ingredients.each do |product_ingredient|
      all_ingredients_safety_rating_total << product_ingredient.ingredient.average_safety_rating
      count += 10
    end
    product_safety_rating = (all_ingredients_safety_rating_total.sum.fdiv(count)) * 100
  end

 def efficacy_rating
    product_ingredients = ProductIngredient.where(product: self)
    all_ingredients_efficacy_rating_total = []
    count = 0
    product_ingredients.each do |product_ingredient|
    all_ingredients_efficacy_rating_total << product_ingredient.ingredient.average_efficacy_rating
      count += 10
    end
    product_efficacy_rating = (all_ingredients_efficacy_rating_total.sum.fdiv(count)) * 100
  end

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
