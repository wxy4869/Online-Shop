Rails.application.routes.draw do
  # resources :order_details
  resources :orders, only: %i[ index create destroy ]
  resources :collects, only: %i[ index create destroy ]
  resources :carts, only: %i[ index create ]
  # resources :product_features
  resources :products, only: %i[ index show new edit create update ]
  get 'welcome/index'
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'cart/my_update/:cart_id/:product_id', to: 'carts#myUpdate', as: :cart_my_update
  get 'cart/my_destroy/:id/', to: 'carts#myDestroy', as: :cart_my_destroy
  post 'order/update_status', to: 'orders#updateStatus', as: :order_update_status
  post 'product/search', to: 'products#search', as: :product_search
  post 'product/update_status', to: 'products#updateStatus', as: :product_update_status
  get 'welcome/center', to: 'welcome#center', as: :welcome_center
  # Defines the root path route ("/")
  root "welcome#index"
end
