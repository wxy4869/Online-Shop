Rails.application.routes.draw do
  resources :order_details
  resources :orders
  resources :collects, only: %i[ index create destroy ]
  resources :carts, only: %i[ index create ]
  resources :product_features
  resources :products
  get 'welcome/index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'cart/my_update/:cart_id/:product_id', to: 'carts#myUpdate', as: :cart_my_update
  get 'cart/my_destroy/:id/', to: 'carts#myDestroy', as: :cart_my_destroy
  # Defines the root path route ("/")
  root "welcome#index"
end
