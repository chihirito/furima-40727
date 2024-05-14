Rails.application.routes.draw do
  devise_for :users
  resources :categories, only: [:index]
  resources :brands, only: [:index]
  resources :items, only: [:index]
  root 'items#index'
end
