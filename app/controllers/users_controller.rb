class UsersController < ApplicationController
  def favorites
    @favorite_products = current_user.all_favorited
  end
end
