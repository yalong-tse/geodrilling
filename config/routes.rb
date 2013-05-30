Geodrilling::Application.routes.draw do
  get "pump/index"

  post "pump/create"

  get "pump/new"

  post "pump/update"

  get "pump/show"

  get "rigmachine/index"

  post "rigmachine/create"

  get "rigmachine/new"

  post "rigmachine/update"

  get "rigmachine/show"

  get "drilltower/index"

  post "drilltower/create"

  get "drilltower/new"

  post "drilltower/update"

  get "drilltower/show"

  get "equipment/stockin"

  get "equipment/stockout"
  
  get "equipment/discard"
  
  get "equipment/group"

  get "archive/contract"

  get "archive/hole"

  get "archive/tourreport"
  post "archive/contractarchive"
  post "archive/holearchive"

  get "tourreports/indexformodify"
  resources :tourreports

  get "holelist/index"
  get "contracts/indexforclose"

  resources :teams


  resources :equipment


  resources :holes


  resources :contracts do
    resources :holes
  end


  resources :materials

  get "material/stockout"
  get "material/discard"

  root :to=>"contracts#index"
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
