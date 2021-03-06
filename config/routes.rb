Rails.application.routes.draw do



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  scope "(:locale)", :locale => /en|es|fr/ do
    root 'application#index'
  end

  resources :users, only: [:new, :show, :edit, :create, :destroy, :update]
  resources :organizations, only: [:index, :show]
  resources :categories, only: [:index, :show] do
    resources :posts do
      resources :chains do
        resources :messages
      end
    end
  end

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  get '/home' => 'static_pages#home'
  get '/about' => 'static_pages#about'
  get '/data' => 'visualizations#index'

  match '/auth/:provider/callback' => 'sessions#create', via: [:get, :post]

  match '/signout' => 'sessions#destroy', :as => :signout, via: [:get, :post]

  match '/signin' => 'sessions#create', :as => :signin, via: [:get, :post]

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
