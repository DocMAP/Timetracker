Rails.application.routes.draw do
  resources :audit_logs do
    member do
      get :confirm
    end
  end

  namespace :admin do
      resources :users
      resources :admin_users
      resources :posts
      resources :audit_logs

      root to: "users#index"
    end

  resources :posts do
    member do
      get :approve
    end
  end
  
  devise_for :users, skip: [:registrations]

  root to: 'static#homepage'
end
