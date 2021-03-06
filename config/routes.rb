Rails.application.routes.draw do
  resources :kintais
  root :to => 'kintais#index'
  match 'search' => 'kintais#search', :via => :post
  get 'kanri' => 'kintais#kanri'  
  match '/chikoku', to: 'kintais#chikoku', via: :get
  match '/shinya', to: 'kintais#shinya', via: :get
  match '/test', to: 'kintais#test', via: :get
  get "kintais/kako/:month" => "kintais#kako", :as => :kako

  resources :kintais do
  collection do
    get 'import_csv_new'
#    match 'kako/:month', :action => :kako, :as => :kako
    post 'import_csv'
  end
  end

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
