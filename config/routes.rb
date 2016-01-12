Rails.application.routes.draw do
  resources :staches, only: [:index, :show]
  resources :categories, only: [:index, :show]
end
