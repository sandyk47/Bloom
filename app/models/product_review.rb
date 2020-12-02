class ProductReview < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :title, presence: true
  validates :content, presence: true
  validates :product_rating, presence: true, numericality: { only_integer: true }, inclusion: { in: 0..5 }
end
