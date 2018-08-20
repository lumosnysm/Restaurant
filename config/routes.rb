Rails.application.routes.draw do
  get 'comments/new'
  root "static_pages#home"
  get "/contact", to: "static_pages#contact"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/cart", to: "carts#show"
  resources :reviews
  resources :users
  resources :menus
  # resources :dishes
  resources :categories
  resources :menudetails
  resources :order_items
  resources :dishes, only: [:index, :show] do
    resources :comments, only: [:create, :destroy]
  end
end
