Rails.application.routes.draw do
  # For details on the DSL available within this file, see
  resources :products, only: [:index]
  resources :related_purchases, only: [:index]
end
