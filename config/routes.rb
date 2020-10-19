Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

# A user can see the list of cocktails
# homepage
  root to: "cocktails#index"

  resources :cocktails, only: [:index, :show, :new, :create, :destroy] do
    resources :doses, only: [:new, :create]
    # resources :reviews, only: [:create]
  end
    resources :doses, only: [:destroy]
end

#GET "cocktails/42"
# A user can create a new cocktail
#GET "cocktails/new"
#POST "cocktails"
