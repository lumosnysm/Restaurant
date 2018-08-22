Rails.application.routes.draw do
  root "static_pages#home"
  get "/contact", to: "static_pages#contact"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/admin", to: "admin/static_pages#index"
  resources :reviews
  resources :users
  resources :menus, only: %i(index show)
  resources :dishes, only: %i(index show)
  resources :categories, only: %i(index show)
  namespace :admin do
   resources :categories
   resources :dishes, except: :index
   resources :menus
   resources :menu_details
   resources :roles
   resources :staffs
  end
end
