Rails.application.routes.draw do
devise_for :users, controllers: { registrations: 'registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  unauthenticated do
root "splash_screen#index" , as: :unauthenticated_root
  end

  authenticated :user do
    root "groups#index", as: :authenticated_root
  end

resources :users
resources :groups
resources :entities
resources :groups do
  resources :entities
end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end