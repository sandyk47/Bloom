class User < ApplicationRecord
  has_many :product_reviews
  has_many :ingredient_reviews

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
