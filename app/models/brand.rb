class Brand < ApplicationRecord
  has_many :products, dependent: :destroy
  validates :name, presence: true, uniqueness: true

  def create
    @brand = Brand.new(brand_params)
    if @brand.save
      redirect_to dashboard_path
    else
      render :new
    end
  end 

end
