Rails.application.routes.draw do
  resources :foods, only: [:index, :show, :new, :create, :destroy]
  resources :recipes, only: [:index, :show, :destroy] do
    resources :recipe_foods, only: [:create] 
  end
  resources :users, only: [:index, :show, :new, :create, :destroy]

  root to: 'foods#index'
end
