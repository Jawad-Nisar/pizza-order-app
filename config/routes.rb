Rails.application.routes.draw do
  resources :orders
  get 'items/index'
  get 'items/show'
  get 'items/create'
  resources :topings
  root "orders#index"
end
