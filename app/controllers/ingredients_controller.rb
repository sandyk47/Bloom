class IngredientsController < ApplicationController

  def index
    if params[:query].present?
      @ingredients = Ingredient.search_by_name_and_description(params[:query])
    else
      @ingredients = Ingredient.all
    end
    add_breadcrumb('/  Ingredients', products_path, true)
  end

  def show
    @ingredient = Ingredient.find(params[:id])
    @ingredient_review = IngredientReview.new
    add_breadcrumb('/  Ingredients', products_path, false)
    add_breadcrumb('/  #{@ingredient.name}', nil, true)
  end

end
