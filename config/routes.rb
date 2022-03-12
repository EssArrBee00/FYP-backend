Rails.application.routes.draw do
  # default_url_options :host => "localhost"
  default_url_options host: 'localhost', port: 3000
  namespace :api do
    scope :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
    end
  end
  namespace :api do
    namespace :v1 do
      resources :products do
        resources :comments
      end
      get '/my_products', to: 'products#user_specific_products'
      get '/admins/all_user_accounts', to: 'admins#get_all_user_accounts', as:'all_user_accounts'
      put '/admins/update_user/:id', to:'admins#update_user', as: 'update_user'
      delete '/admins/remove_user/:id', to:'admins#remove_user', as: 'remove_user'
      put '/admins/update_product/:id', to:'admins#update_product', as: 'update_product'
      delete '/admins/remove_product/:id', to:'admins#remove_product', as: 'remove_product'
      get '/admins/all_products', to: 'admins#get_all_products', as:'all_products'
      get '/all_categories', to: 'categories#all_categories', as:'all_categories'
      get '/user_specific_categories', to: 'categories#user_specific_categories', as:'user_specific_categories'
      post '/create_category', to: 'categories#create_category', as:'create_category'
      put '/update_category/:id', to: 'categories#update_category', as:'update_category'
      delete '/destroy_category/:id', to: 'categories#destroy_category', as:'destroy_category'
      post '/create_sub_category', to: 'categories#create_sub_category', as:'create_sub_category'
      put '/update_sub_category/:id', to: 'categories#update_sub_category', as:'update_sub_category'
      delete '/destroy_sub_category/:id', to: 'categories#destroy_sub_category', as:'destroy_sub_category'
      put '/products/:id/add_images', to: 'products#add_images', as:'add_images'
      delete '/products/:id/remove_image/:index', to: 'products#remove_image', as:'remove_image'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
