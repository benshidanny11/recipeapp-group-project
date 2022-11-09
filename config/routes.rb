# frozen_string_literal: true

Rails.application.routes.draw do
  get 'public_recipes/index'
  get 'recipes/index'
  devise_for :users
  resources :recipes, only: %i[index show new create destroy update] do
    resources :food_recipes, only: %i[new create destroy edit update]
  end
  root 'users#index'
  resources :foods
end
