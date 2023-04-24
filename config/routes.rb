# frozen_string_literal: true

Rails.application.routes.draw do
  root 'page#home'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  resources :restaurants
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #金流路徑
  #首頁-升級會員
  get '/pricing', to: 'page#pricing'
  get '/pricing/paymentok', to: 'page#paymentok'
  post '/pricing/return', to: 'page#return'
  post '/pricing/notify', to: 'page#notify'

end
