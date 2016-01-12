Rails.application.routes.draw do
  resources :staches, only: [:index]

  resources :cart_staches, only: [:create]

  resource :cart, only: [:show]
end
