require 'api_constraints'

Mygov::Application.routes.draw do
  devise_for :users, :path => '', :controllers => {
    :omniauth_callbacks => "users/omniauth_callbacks",
    :registrations => 'users/registrations',
    :confirmations => 'users/confirmations',
    :sessions => 'users/sessions'
  }
  devise_scope :user do
    get 'sign_up', :to => 'users/registrations#new', :as => :sign_up
    get 'thank_you', :to => 'users/registrations#thank_you', :as => :thank_you
    get 'sign_in', :to => 'users/sessions#new', :as => :sign_in
    get 'sign_out', :to => 'users/sessions#destroy', :as => :sign_out
    get 'more_sign_in_options', :to => 'users/sessions#more_sign_in_options', :as => :more_sign_in_options
  end
  get 'oauth/authorize' => 'oauth#authorize'
  post 'oauth/authorize' => 'oauth#authorize'
  post 'oauth/allow' => 'oauth#allow'
  get 'oauth/unknown_app' => 'oauth#unknown_app', :as => :unknown_app
  resources :beta_signups, :only => [:create]
  resource :user, :only => [:destroy]
  resource :profile, :only => [:show]
  resources :settings, :only => [:index] do
    collection do
      resources :authentications
    end
  end
  resources :notifications, :only => [:index, :show, :create, :destroy]
  resources :tasks, :only => [:show, :update, :destroy]
  resources :apps do
    member do
      get :uninstall
    end
  end
  resources :task_items, :only => [:update, :destroy]

  get 'dashboard' => "home#dashboard"
  get 'discovery' => "home#discovery"
  get 'developer' => "home#developer"
  get 'privacy-policy' => "home#privacy_policy", :as => :privacy_policy
  get 'terms-of-service' => "home#terms_of_service", :as => :terms_of_service
  get 'about' => "home#about", :as => :about
  get 'paperwork-reduction-act-statement' => "home#pra", :as => :pra
  get 'activity-log' => "home#activity_log", :as => :activity_log
  get 'xrds' => "home#xrds", :as => :xrds

  namespace :api, :defaults => {:format => :json} do
    scope :module => :v1, :constraints => ApiConstraints.new(:version => 1, :default => true) do
      resource :profile, :only => [:show]
      resources :notifications, :only => [:create]
      resources :tasks, :only => [:index, :create, :show]
      resources :forms, :only => [:create, :show]
    end
  end
  match "/404", :to => "errors#not_found"
  rack_error_handler = ActionDispatch::PublicExceptions.new('public/')
  match "/422" => rack_error_handler
  match "/500" => rack_error_handler  
  
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
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
