# frozen_string_literal: true

Rails.application.routes.draw do
  root 'page#home'
  # resources :passwords, only: [:edit, :update]
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  resources :comments
  resources :restaurants
end
