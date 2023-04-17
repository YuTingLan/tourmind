# frozen_string_literal: true

Rails.application.routes.draw do
  root 'page#home'
  # resources :passwords, only: [:edit, :update]

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  resources :restaurants
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :hotels
  resources :sites
end
