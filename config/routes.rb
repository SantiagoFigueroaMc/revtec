# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :controllers
  resources :roles
  devise_for :users, controllers: {
    sessions: 'user/sessions',
    registrations: 'user/registrations'
  }

  resources :users do
    resources :roles
    resources :clients do
      resources :cars
      resources :addresses
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root to: 'public#home'

  get 'about', to: 'public#about'

end
