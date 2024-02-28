Rails.application.routes.draw do
  resources :orders do
    member do
      post :enable_complete
    end
  end
  # post "/enable_complete" => "orders#enable_complete", :as => :enable_complete
  get 'items/index'
  get 'items/show'
  get 'items/create'
  resources :topings
  root "orders#index"
end
