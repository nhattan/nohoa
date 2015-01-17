Flower::Application.routes.draw do
  devise_for :users

  devise_scope :user do
    get '/login' => 'devise/sessions#new', :as => :login
    post '/login' => 'devise/sessions#create', :as => :create_new_session
    get '/logout' => 'devise/sessions#destroy', :as => :logout
    get '/signup' => 'devise/registrations#new', :as => :signup
    post '/signup' => 'devise/registrations#create', :as => :registration
    get '/password/recover' => 'devise/passwords#new', :as => :recover_password
    post '/password/recover' => 'devise/passwords#create', :as => :reset_password
    get '/password/change' => 'devise/passwords#edit', :as => :edit_password
    put '/password/change' => 'devise/passwords#update', :as => :update_password
  end

  root "homes#index"

  namespace :admin do
    root "users#index"
    resources :users
    resources :bugs
    resources :solutions
    resources :categories
  end

  # resources :users
  # get 'auth/:provider/callback', to: 'facebook_auths#create'
  # get 'auth/failure', to: redirect('/')


  # namespace :admin do
  #   resources :users
  # end
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
