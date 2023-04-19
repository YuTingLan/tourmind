Rails.application.routes.draw do
  resources :comments
  root "page#home"
end
