Rails.application.routes.draw do
  
  devise_for :users
  resources :products
  resources :reviews
  resources :products

  root 'top#pre_search'
  get '/products/:id' => 'products#show'
  get '/link/:id' => 'top#link'


  post '/entry/:product_id' => 'top#post'
  get '/entry/:id' => 'top#entry'


  get '/search' => 'top#search'
  get '/list' => 'products#show_professer'
  get '/easy' => 'top#easy'
  get '/fun' => 'top#fun'
  get '/pre_search' =>'top#pre_search'
  get '/pre_search_review' =>'top#pre_search_review'
  get '/pre_search_entry' => 'top#pre_search_entry'
  get '/pre_search_test' => 'top#pre_search_test'
  get '/search_2' => 'top#search_2'
  get '/search_3' => 'top#search_3'
  get '/search_4' => 'top#search_4'
  get '/users/sign_out' => 'devise/sessions#destroy'
  get '/reviews/:id/edit' => 'top#edit'
  get '/thank_you' => 'top#thank_you'


  post '/test/:product_id' => 'tests#create'
  get '/test/:id' => 'tests#set_product'
  get 'show/test/:id' => 'tests#show'
  get '/show/:id' => 'top#show'
  get '/test/:id/image' => 'tests#show_image'
  get '/tests/index' => 'tests#index'
  get '/thank_you' => 'tests#thank_you'

   resources :tests

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
