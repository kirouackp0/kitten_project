# frozen_string_literal: true

Rails.application.routes.draw do
  root 'items#index'
  resources :items
  devise_for :users
  resources :carts, except: %i[index new edit]
  resources :cart_items, ONLY: %i[create destroy]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
