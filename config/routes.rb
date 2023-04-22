Rails.application.routes.draw do
  root "page#home"
  resources :comments
  resources :restaurants
end
