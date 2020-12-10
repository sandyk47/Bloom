class ProductsController < ApplicationController


  def index

    @page = params.fetch(:page, 0).to_i
    @products = Product.offset(@page * Product::PRODUCTS_PER_PAGE).limit(Product::PRODUCTS_PER_PAGE)
    @products = ProductSearch.new(@products, params).query
    add_breadcrumb('Products', products_path, true)
    @product_search = ProductSearch.new(@products, params)
    # respond_to do |format|
    # format.html
    # format.js
    # end
  end

  def new
    # we need @booking in our `simple_form_for`
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

   def show
    @product = Product.find(params[:id])
    @product_review = ProductReview.new
    @product_ingredients = ProductIngredient.where(product: @product)
    add_breadcrumb("Products", products_path, false)
    add_breadcrumb("#{@product.title}", nil, true)
  end

  private


  def product_params
    params.require(:product).permit(:remove_tag, :title, :brand_id, :description, :average_product_rating_stars, :average_efficacy_rating_bar, :average_safety_rating_bar, tag_list: [])
  end
end


