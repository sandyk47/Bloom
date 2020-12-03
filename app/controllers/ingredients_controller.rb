class IngredientsController < ApplicationController

  def index
    if params[:query].present?
      @ingredients = Ingredient.where(name: params[:query])
    else
      @ingredients = Ingredient.all
    end
  end

  def show
    @ingredient = Ingredient.find(params[:id])
    # @ingredient_reviews = IngredientReviews.where(ingredient_id: @ingredient.id)
  end


end
