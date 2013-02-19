Ect::Application.routes.draw do

  authenticated :user do
    root :to => 'home#index'
  end

  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"} do
      get 'users/edit_employee', :to => "registrations#edit_employee", :as=> "edit_employee"
    end
  
  resources :users do
    collection do
      get 'show_employee'
      get 'index_workflow'
    end
    member do
      get 'edit_employee'
      get 'edit_workflow'
      post 'add_holiday'
    end
    resources :user_holidays
    resources :planned_holidays do
      member do
        get "send_request"
        get "withdraw_request"
        get "cancel_request"
        get "accept_request"
        get "reject_request"
        get "accept_withdraw"
        get "reject_withdraw"
      end
      collection do
        get "index2"
      end
    end

  end

  resources :work_time_types
  resources :planned_work_times
  resources :work_sites
  resources :time_frames
  resources :time_sheets do
    member do
      get   'date_view'
    end
  end

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

  # You can have the root of your work_sites routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
