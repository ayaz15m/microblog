Rails.application.routes.draw do
  devise_for :logins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'other_profile/:id' => 'other_profile#index', as: :profile
  get 'feed/message/:id' => 'feed#message', as: :message
  post 'feed/message/:id' => 'feed#create_message', as: :messages
  get 'other_profile/friends/:id' => 'other_profile#friends', as: :friends
  post "other_profile" => "other_profile#create_relationship", as: :profiles
  delete 'other_profile/:id' => "other_profile#destroy"
  delete 'other_profile/:id/unfollow' => "other_profile#delete", as: :unfollow

  get "feed/:id/edit" => "feed#edit", as: :edit_profile

  get 'feed' => "feed#update", as: :pics
  patch 'feed' => "feed#update"

  root to: "feed#index"

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
