Rails.application.routes.draw do
  resources :staches, only: [:index]
end
