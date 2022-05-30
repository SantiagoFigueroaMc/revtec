# frozen_string_literal: true

Rails.application.routes.draw do
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'sign_up', to: 'users#new', as: 'sign_up'
  root to: 'public#home'

  resources :sessions
  resources :users
  resources :cars
  resources :addresses
  resources :clients
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


  get '/clients', to: redirect('public#home')

  resources :client do
    resources :cars
    resources :addresses
  end
end
