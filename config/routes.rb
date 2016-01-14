Rails.application.routes.draw do
  post "headshot/capture" => 'headshot#capture', :as => :headshot_capture
  resources :cart_staches, only: [:create, :destroy]
  resource :cart, only: [:show]
  resources :staches, only: [:index, :show]
  resources :categories, only: [:index, :show]
  resources :users, only: [:new, :create]

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/dashboard", to: "users#show"
  post "update_quantity", to: "cart_staches#update_quantity"
  get "show_stache", to: "users#show_stache"
  get "mustache_me", to: "users#mustache_me"
  root "categories#index"
end
