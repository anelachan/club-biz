ClubBiz::Application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :students do
    member do
      get :clubs
      get :events
      get :messages
    end
  end
  resources :admins do
    member do
      get :events
      get :details
      get :groups
    end
  end
  resources :clubs
  resources :student_clubs, only: [:create, :destroy]
  resources :events do
    member do
      get :club
      get :ads
      get :announcements
      get :new_reservation
      get :sales
    end
  end
  resources :ticket_reservations, only: :create
  resources :posts, only: :create
  resources :ads, only: :create
  resources :announcements, only: :create
  resources :messages, only: :create
  resources :registered_clubs do
    member do
      get :officers
    end
  end
  resources :officers, only: :create
  resources :verifications, only: [:new, :create, :update]
  resources :admin_details, only: :create

  root 'static_pages#home'
  match '/signup',  to: 'students#new',         via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  get 'search_events' => 'events#index'
  get 'search_clubs' => 'clubs#index'
  
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
