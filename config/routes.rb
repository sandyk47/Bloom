Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :products, only: [:index, :show, :new, :create ] do
    resources :product_reviews, only: [ :create ]
    resources :favorites, only: [:create]

  end
  resources :favorites, only: [:destroy]
  resources :ingredients, only: [ :index, :show, :create ] do
    resources :ingredient_reviews, only: [ :create ]
  end
  #patch "products/:id" => "products#favorite", as: :product_favorite
  #delete "products/:id" => "products#unfavorite", as: :product_unfavorite
  get "favorites" => "users#favorites", as: :users_favorites
end
