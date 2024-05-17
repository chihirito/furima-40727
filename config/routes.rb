Rails.application.routes.draw do
  devise_for :users
  resources :products, only: [:index, :new, :create]
  root to: 'products#index'
  resources :products
end
