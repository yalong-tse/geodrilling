Geodrilling::Application.routes.draw do
  get "groups/index"
  get "groups/main"
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

  get "pump/new"

  post "pump/update"

  get "pump/show"
  get "pump/resume"

  get "rigmachine/index"

  post "rigmachine/create"

  get "rigmachine/new"

  post "rigmachine/update"

  get "rigmachine/show"
  get "rigmachine/resume"

  get "drilltower/index"

  post "drilltower/create"

  get "drilltower/new"

  post "drilltower/update"

  get "drilltower/show"
  get "drilltower/resume"

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
  resources :tourreports

  get "holelist/index"
  get "holelist/deployment"
  post "holelist/create"

  get "holes/download"
  get "holes/list"
  get "holes/tourreports"
  get "contracts/indexforclose"
  get "contracts/download"
  get "contracts/close"

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
