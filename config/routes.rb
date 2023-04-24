Rails.application.routes.draw do
  resources :restaurants
  resources :plans
  post "/day_info", to: "plans#day_info"
  post "/plan_overview", to: "plans#plan_overview"
end
