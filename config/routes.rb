Rails.application.routes.draw do

  root "page#home"
  resources :restaurants
end
