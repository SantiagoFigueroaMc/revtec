# frozen_string_literal: true

Rails.application.routes.draw do
  resources :cars
  resources :addresses
  resources :clients
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root to: 'public#home'

  get '/clients', to: redirect('public#home')

  resources :client do
    resources :cars
    resources :addresses
  end
end
