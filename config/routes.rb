Rails.application.routes.draw do
  
  root 'static_pages#index'

  resources :line_items

  resources :carts

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  namespace :instructor do
    resources :courses, only: [:new, :create, :show, :edit]
    resources :sessions, only: [:new, :create, :show]
  end

  resources :courses

  get 'about', :to => 'static_pages#about'

  get 'faq', :to => 'static_pages#faq'

  get 'thank_you/:cart_id', :to => 'static_pages#thank_you', as: :thank_you

  get 'thank_you_invoice/:cart_id', :to => 'static_pages#thank_you_invoice', as: :thank_you_invoice

  resource :dashboard, :only => [:show] 

  resources :charges

  get 'invoice_request', :to => 'charges#send_invoice', as: :invoice_request

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
