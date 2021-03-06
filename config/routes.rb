ModernGlass::Application.routes.draw do
  get "cart/index"

  mount Ckeditor::Engine => "/ckeditor"

  # Loads root path 
  root :to => 'home#index', :via => :get
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Loads /products 
  match 'products'        => 'product#index',       :as => :products,       :via => :get

  # Loads /product/id
  match 'product/:id'     => 'product#show',        :as => :product,        :via => :get

  # Loads /product/new
  match 'products/new'    => 'product#new',         :as => :new_products,   :via => :get 

  # Loads /products/sale
  match 'products/sale'   => 'product#sale',         :as => :sale_products,  :via => :get

  # Loads /product/category
  match 'category/:id'    => 'product#category',    :as => :category,       :via => :get

  # Loads the search results
  match 'search_results'  => 'home#search_results', :as => :search_results, :via => :post 

  # Loads the about us/contact us pages
  match 'page/:id'        => 'home#page',           :as => :page,           :via => :get

  match 'cart'            => 'cart#index',          :as => :cart,           :via => :get

  match 'add/:id'         => 'cart#add_to_cart',    :as => :add_to_cart,    :via => :get

  match 'remove/:id'      => 'cart#remove_from_cart', :as => :remove_from_cart, :via => :get

  match 'empty'           => 'cart#empty_cart',      :as => :empty_cart,    :via => :get

  match 'checkout'        => 'cart#checkout',        :as => :checkout,      :via => :get

  match 'confirmation'    => 'cart#confirmation',    :as => :confirmation,  :via => :post

  match 'create'          => 'cart#create',          :as => :create,        :via => :post

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
