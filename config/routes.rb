Rails.application.routes.draw do
  namespace :admin do
    get "/dashboard", to: "dashboard#show"
    resources :categories, only: [:index, :create, :edit, :update]
    resources :staches, only: [:new, :create, :index, :edit, :destroy, :update]
    resources :orders, only: [:show]
    put "cancel_order", to: "orders#cancel"
    put "paid_order", to: "orders#paid"
    put "complete_order", to: "orders#complete"
    put "retire_stache", to: "staches#retire"
    put "activate_stache", to: "staches#activate"
  end

  resources :cart_staches, only: [:create, :destroy]
  resource :cart, only: [:show]
  resources :staches, only: [:index, :show]
  resources :categories, only: [:index, :show]
  resources :users, only: [:new, :create, :edit, :update]
  resources :orders, only: [:index, :show, :new, :create]

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/dashboard", to: "users#show"
  post "update_quantity", to: "cart_staches#update_quantity"

  root "categories#index"
end
