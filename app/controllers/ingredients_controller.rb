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
    @ingredient_review = IngredientReview.new
  end


end
