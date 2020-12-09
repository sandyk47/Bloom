class Product < ApplicationRecord
  PRODUCTS_PER_PAGE = 12
  scope :by_category, ->(n = []) { where("category IN (?)", n) }
  scope :by_brand, ->(n = []) { where("brand_id IN (?)", n) }

  acts_as_taggable_on :tags
  acts_as_taggable_on :conditions
  acts_as_taggable_on :ingredient_preferences
  acts_as_taggable_on :skin_concerns
  acts_as_taggable_on :skin_types
  acts_as_taggable_on :accreditations

  acts_as_favoritable

  belongs_to :brand
  has_many :product_ingredients

  has_many :ingredients, through: :product_ingredients
  has_many :product_reviews

  validates :title, presence: true, uniqueness: true

  def self.categories
    distinct.pluck(:category)
  end

  def self.brands
    Brand.all
  end

  def safety_rating
    product_ingredients = ProductIngredient.where(product: self)

    all_ingredients_safety_rating_total = []
    count = 0
    product_safety_rating = 0
    product_ingredients.each do |product_ingredient|
      if  product_ingredient.nil? || product_ingredient.ingredient.average_safety_rating.nil?
        product_safety_rating += 0
      else
          all_ingredients_safety_rating_total << product_ingredient.ingredient.average_safety_rating
          product_ingredient.ingredient.average_safety_rating.nil? ? product_safety_rating = 0 : count += 10
          product_safety_rating = (all_ingredients_safety_rating_total.sum.fdiv(count)) * 100 if count > 0
      end
    end
    product_safety_rating / 10
  end

 def efficacy_rating
    product_ingredients = ProductIngredient.where(product: self)

    all_ingredients_efficacy_rating_total = []
    count = 0
    product_efficacy_rating = 0

    product_ingredients.each do |product_ingredient|
      if  product_ingredients.nil? || product_ingredient.ingredient.average_safety_rating.nil?
        product_efficacy_rating += 0
      else
          all_ingredients_efficacy_rating_total << product_ingredient.ingredient.average_efficacy_rating
          product_ingredient.ingredient.average_efficacy_rating.nil? ? product_efficacy_rating = 0 : count += 10
          product_efficacy_rating = (all_ingredients_efficacy_rating_total.sum.fdiv(count)) * 100 if count > 0
      end
    end
    product_efficacy_rating / 10
  end

  def user_rating
    product_reviews = ProductReview.where(product: self)
    user_rating = product_reviews.average(:product_rating)
    self.update(average_product_rating_stars: user_rating)
    self.average_product_rating_stars
  end

  def star_5
    product_reviews = ProductReview.where(product: self)
    stars_5 = product_reviews.where(product_rating: 5)
    starts_5_total = stars_5.count
  end
  def star_4
    product_reviews = ProductReview.where(product: self)
    stars_4 = product_reviews.where(product_rating: 4)
    starts_4_total = stars_4.count
  end

  def star_3
    product_reviews = ProductReview.where(product: self)
    stars_3 = product_reviews.where(product_rating: 3)
    starts_3_total = stars_3.count
  end

  def star_2
    product_reviews = ProductReview.where(product: self)
    stars_2 = product_reviews.where(product_rating: 2)
    starts_2_total = stars_2.count
  end

  def star_1
    product_reviews = ProductReview.where(product: self)
    stars_1 = product_reviews.where(product_rating: 1)
    starts_1_total = stars_1.count
  end


  include PgSearch::Model
  pg_search_scope :product_and_brand_search,
    against: [ :title, :description, :oneliner, :category, :sub_category ],
    associated_against: {
      brand: [ :name ]
    },
    using: {
      tsearch: { prefix: true }
    }

  private

  def user_params
    params.require(:product).permit(:title, :description, :benefits, :oneliner, :img, :category, :subcategory, :brand_id)
  end

end
