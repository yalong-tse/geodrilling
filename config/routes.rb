Geodrilling::Application.routes.draw do
  get "groups/index"
  get "groups/main"
  get "groups/deploy"
  post "groups/saveleader"
  resources :groups

  get "useroperation/index"

  get "useroperation/show"

  get "dictionary/index"

  get "dictionary/show"

  get "dictionary/new"

  get "dictionary/destroy"

  post "dictionary/create"

  get "pump/index"

  post "pump/create"
  post "pump/dismiss"

  get "pump/new"

  post "pump/update"

  get "pump/show"
  get "pump/resume"
  get "pump/download"
  get "pump/discard"

  get "rigmachine/index"

  post "rigmachine/create"
  post "rigmachine/dismiss"

  get "rigmachine/new"

  post "rigmachine/update"

  get "rigmachine/show"
  get "rigmachine/resume"
  get "rigmachine/download"
  get "rigmachine/discard"

  get "drilltower/index"

  post "drilltower/create"
  post "drilltower/dismiss"

  get "drilltower/new"

  post "drilltower/update"

  get "drilltower/show"
  get "drilltower/resume"
  get "drilltower/download"
  get "drilltower/discard"

  get "equipment/stockin"

  get "equipment/stockout"
  
  get "equipment/discard"
  post "equipment/resume"
  
  get "equipment/group"

  get "archive/contract"

  get "archive/hole"

  get "archive/tourreport"
  post "archive/contractarchive"
  post "archive/holearchive"

  get "tourreports/indexformodify"
  get "tourreports/holesreport"

  resources :tourreports

  get "holelist/index"
  get "holelist/deployment"
  post "holelist/create"

  get "holes/download"
  get "holes/list"
  get "holes/tourreports"
  get "holes/tourreportsmodify"
  get "holes/close"
  get "contracts/indexforclose"
  get "contracts/download"
  post "contracts/archive"
  get "contracts/chart"

  get "schedule/index"

  resources :teams


  resources :equipment


  resources :holes

  resources :contracts

  get "materials/stockout"
  get "materials/discard"

  resources :materials

  get "login" => "sessions#new", :as => "login"
  get "logout" => "sessions#destroy", :as => "logout"

  resources :roles do
    collection do
      delete 'destroy_multiple'
    end
  end
  resources :sessions

  get "departments/dynamic_tree"

  resources :departments do
    resources :users do
      collection do
        delete 'destroy_multiple'
      end
    end
  end

  match '/department_tree', :to => 'departments#main'
  get '/users/main'


#  root :to=>"contracts#index"
  root :to => "sessions#new"
end
