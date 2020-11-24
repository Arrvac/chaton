Rails.application.routes.draw do
  get 'carts/show'
  devise_for :users

  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'items#index'
  resources :items
  resources :carts

end
