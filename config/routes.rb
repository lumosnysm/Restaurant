Rails.application.routes.draw do
  root "static_pages#home"
  get "/contact", to: "static_pages#contact"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :reviews
  resources :users
  resources :menus
  resources :dishes
  resources :categories
end
