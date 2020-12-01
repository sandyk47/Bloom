class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.all
  end

  def show
    @ingredient = Ingredient.find(params[:id])
    # @ingredient_reviews = IngredientReviews.where(ingredient_id: @ingredient.id)
  end

end
