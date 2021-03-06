# frozen_string_literal: true

# Rails routes
Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'users/sign_in', to: 'dashboard#welcome'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users do
  end
  get 'dashboard/welcome'
  root 'dashboard#index'
  resources :dashboard, only: :index
  resources :tournaments, only: [:index, :show] do
    member do
      get :leaderboard
      get :leader_board
      get :select_favourite_team
      patch :update_favourite_team
      get :fan_club
      get :fan_club_members
      get :prediction_graph
      get :show_prediction_graph
    end

    collection do
      post :predict_match
      post :update_match
    end
  end

  resources :challenges do
    member do
      get :points_table
      get :predictions_table
      get :payment_details
      get :challenge_payments
      get :prize_list
      get :show_user_challenges
      post :update_user_challenges
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
