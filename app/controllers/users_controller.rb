class UsersController < ApplicationController
  def favorites
    @user = current_user.all_favorited
  end
end
