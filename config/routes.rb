Geodrilling::Application.routes.draw do
  match "holedesigner/view" , :via=> :get , :as=> :holedesigner_view

  match "leader/holeproduct" , :via=> :get , :as => :leader_holeproduct
  match "leader/holefinish" , :via=>:get , :as=> :leader_holefinish
  match "leader/contract" , :via=>:get, :as=> :leader_contract
  match "leader/yearreport" , :via=>:get, :as => :leader_yearreport
  match "leader/lastyearleft" , :via=>:get, :as => :leader_lastyearleft
  match "leader/savelastyear" , :via=>:post, :as=> :leader_savelastyear

  match "groups/index" , :via=>:get , :as=>:groups_index
  match "groups/main" , :via=>:get , :as=>:groups_main
  match "groups/deploy" , :via=>:get , :as=>:groups_deploy
  match "groups/saveleader", :via=>:post , :as=>:groups_saveleader

  resources :groups


  get "useroperation/index"

  get "useroperation/show"

  match "dictionary/index" , :via=>:get , :as=>:dictionary_index
  match "dictionary/show", :via=>:get , :as=>:dictionary_show
  match "dictionary/new" , :via=>:get , :as=>:dictionary_new
  match "dictionary/destroy" ,:via=>:get , :as=>:dictionary_destroy
  match "dictionary/create" ,:via=>:post

  match "pump/index" , :via=>:get
  match "pump/create" , :via=>:post
  match "pump/dismiss", :via=>:post

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
  post "tourreports/holesreport"

  resources :tourreports

  get "holelist/index"
  get "holelist/deployment"
  post "holelist/create"

  match "holes/download" ,:via =>:get , :as => :holes_download
  match "holes/list" , :via=> :get , :as =>:holes_list
  match "holes/closelist" ,:via=>:get , :as=>:holes_closelist
  match "holes/tourreports" ,:via=>:get , :as=> :holes_tourreports

  get "holes/tourreportsmodify"
  get "holes/close"
  get "contracts/indexforclose"
  get "contracts/download"
  post "contracts/deleteAttachment"
  post "contracts/archive"

  get "/contractschart" => "contracts#chart", :as=>"contractschart"

  match "schedule/index" ,:via =>:get , :as => :schedule_index

  #for mobile rest service 
  match "mobile/contracts" ,:via =>:get , :as => :mobile_contracts
  match "mobile/contractholes" ,:via =>:get , :as => :mobile_contractholes
  match "mobile/getdeployments" ,:via =>:get , :as => :mobile_getdeployments
  match "mobile/holedetail" ,:via =>:get , :as => :mobile_holedetail
  match "mobile/savetourreport" ,:via =>:post , :as => :mobile_savetourreport
  match "mobile/validateuser" ,:via =>:get , :as => :mobile_validateuser
  match "mobile/queryownholes" ,:via =>:get , :as => :mobile_queryownholes
  match "mobile/queryuserinfo" ,:via =>:get , :as => :mobile_queryuserinfo

  resources :teams


  resources :equipment


  resources :holes

  resources :contracts

  get "materials/stockout"
  post "materials/dismiss"

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
