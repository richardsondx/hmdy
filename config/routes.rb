Gigiki::Application.routes.draw do
  
 match '/auth/:provider/callback', to: 'sessions#create'
 match "/signout" => "sessions#destroy", :as => :signout

 #create the match between the :id and the micropost with the action display
 match "microposts/display/:id" => "microposts#display"

 resources :microposts do
   resources :comments
   member do
   get 'display'
  end
 end
 

 
resources :users, :only => [:show, :create] do
   member do
     get 'liked'
     get 'disliked'
     get 'ignored'
     get 'stashed'
     get 'similar'
   end
 end
 
 resources :microposts, :only => :show do
   member do
     post 'like'
     delete 'like'    => :unlike
     post 'dislike'
     delete 'dislike' => :undislike
     post 'ignore'
     delete 'ignore'  => :unignore
     post 'stash'
     delete 'stash'   => :unstash
     
     post 'flagthis'
     get 'recent'
     get 'popular'
   end
 end
 
 
 #get the pages index and tips
 match "pages" => "pages#index"
 match "tips" => "pages#tips"
 match "facebook" => "pages#facebook"
 match "advertise" => "pages#advertise"
 match "contact" => "pages#contact"
 match "terms" => "pages#terms"
 match "popular" => "pages#popular"
 #set the liaision between the two pages and crate the path 'page_path'
 match "pages/:id" => "microposts#display" , :as => :page

  get "microposts/index"
  get "microposts/edit"
  get "microposts/new"
  get "microposts/show"
  get "microposts/display"
  get "pages/contact"
  get "pages/advertise"
  get "pages/terms"
  get "pages/popular"

  get "/filter/:filter", :controller => "pages", :action => "index"

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
   root :to => 'pages#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
end
