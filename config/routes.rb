Rails.application.routes.draw do
  get 'dashboard' => "home#dashboard"
  get 'order_history'=> "home#order_history"
  get 'track_product'=> "home#track_product"
  devise_for :admins
  root "guitars#index"
  resources :accessories
  resources :guitars
  resources :straps
  resources :picks
  resources :brands
  resources :categories
  get "carts" => "carts#carts"
  post "add_to_cart/:type/:id" => "carts#add_to_cart",:as => "add_to_cart"
  delete "cart_item/:id" => "carts#delete_cart_item", :as => "delete_cart_item"
  put "cart_item/:id" => "carts#update_cart_item",:as => "update_cart_item"
  get "edit_cartitem" => "carts#edit_cartitem"
  get "place_order" => "carts#place_order"
  post "place_order" => "carts#create_order"
  get "test1" => "tests#index1"

end
