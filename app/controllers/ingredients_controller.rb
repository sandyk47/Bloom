class IngredientsController < ApplicationController
  INGREDIENTS_PER_PAGE = 36

  def index
    @page = params.fetch(:page, 0).to_i
    if params[:query].present?
      @ingredients = Ingredient.search_by_name_and_description(params[:query])
    else
      @ingredients = Ingredient.offset(@page * INGREDIENTS_PER_PAGE).limit(INGREDIENTS_PER_PAGE)
    end
    add_breadcrumb('/  Ingredients', products_path, true)
  end

  def show
    @ingredient = Ingredient.find(params[:id])
    @ingredient_review = IngredientReview.new
    add_breadcrumb('/  Ingredients', ingredients_path, false)
    add_breadcrumb("/  #{@ingredient.name}", nil, true)
  end

end
