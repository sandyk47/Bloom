class User < ApplicationRecord
GENDER = ["Male", "Female", "Genderqueer/Non-Binary", "Prefer not to disclose"]

  has_one_attached :photo
  has_many :product_reviews
  has_many :ingredient_reviews

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :age, presence: true, numericality: { only_integer: true }
  validates :gender, presence: true, inclusion: { in: GENDER }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
