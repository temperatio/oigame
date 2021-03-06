Oigame::Application.routes.draw do

  get 'donate' => 'donate#index', :as => 'donate'
  get 'donate/init' => 'donate#init', :as => 'donate_init'
  get 'donate/accepted' => 'donate#accepted'
  get 'donate/denied' => 'donate#denied'
  get 'answers' => 'pages#answers', :as => 'answers'
  get 'privacy-policy' => 'pages#privacy_policy', :as => 'privacy_policy'
  get 'contact' => 'pages#contact', :as => 'contact'
  post 'contact' => 'pages#contact', :as => 'contact'
  get 'contact/received' => 'pages#contact_received', :as => 'contact_received'
  devise_for :users, :path_names => { :sign_in => 'login', :sign_out => 'logout', :sign_up => 'signup' }, :controllers => { :registrations => "users/registrations" }
  resources :campaigns do
    member do
      post 'message'
      get 'message'
      get 'widget'
      get 'widget-iframe.html' => 'campaigns#widget_iframe', :as => 'widget_iframe'
      post 'activate'
      post 'deactivate'
    end
    collection do
      get 'tag'
      get 'moderated'
      get 'feed', :defaults => { :format => 'rss' }
    end
  end
  #devise_for :admin_users, ActiveAdmin::Devise.config
  #ActiveAdmin.routes(self)

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
  root :to => 'pages#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
