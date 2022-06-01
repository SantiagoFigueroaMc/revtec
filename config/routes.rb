# frozen_string_literal: true

Rails.application.routes.draw do
  resources :roles
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :cars
  resources :addresses
  resources :clients
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root to: 'public#home'

  get 'about', to: 'public#about'

  resources :client do
    resources :cars
    resources :addresses
  end
end
