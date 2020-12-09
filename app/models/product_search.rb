class ProductSearch
  attr_reader :params
  include ActiveModel::Model

  def initialize(products, params)
    @params = params
    @products = products
  end

  def tag
    params.dig(:product_search, :tag)
  end

  def category
    params.dig(:product_search, :category)
  end

  def brand
    params.dig(:product_search, :brand)
  end

  def page
    params.fetch(:page, 0).to_i
  end

  def query
    if params[:query].present?
      @products = @products.product_and_brand_search(params[:query])
    elsif params[:product_search].nil?
      @products = Product.offset(page * Product::PRODUCTS_PER_PAGE).limit(Product::PRODUCTS_PER_PAGE)
    elsif params[:product_search][:tag].present? && params[:product_search]['category'].present? && params[:product_search]['brand'].present?
      @products =  @products.by_brand(params[:product_search]['brand'])
      @products =  @products.by_category(params[:product_search]['category'])
      @products =  @products.tagged_with(params[:product_search][:tag])
    elsif params[:product_search][:tag].present? && params[:product_search]['category'].present?
      @products = @products.by_category(params[:product_search]['category'])
      @products = @products.tagged_with(params[:product_search][:tag])
    elsif params[:product_search][:tag].present? && params[:product_search]['brand'].present?
      @products = @products.by_brand(params[:product_search]['brand'])
      @products = @products.tagged_with(params[:product_search][:tag])
    elsif params[:product_search]['category'].present? && params[:product_search]['brand'].present?
      @products = @products.by_brand(params[:product_search]['brand'])
      @products = @products.by_category(params[:product_search]['category'])
    elsif params[:product_search][:tag].present?
      @products = @products.tagged_with(params[:product_search][:tag])
    elsif params[:product_search]['category'].present?
      @products = @products.by_category(params[:product_search]['category'])
    elsif params[:product_search][:brand].present?
      @products = @products.by_brand(params[:product_search]['brand'])
    end
    @products
  end

end
