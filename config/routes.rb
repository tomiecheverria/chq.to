Rails.application.routes.draw do
  devise_for :users
  resource :user, only: [:show]
  resources :links
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  root to: "home#index"
  

#   devise_for :users, path: 'auth', path_names: {
#   sign_in: 'login',
#   sign_out: 'logout',
#   password: 'secret',
#   confirmation: 'verification',
#   unlock: 'unblock',
#   registration: 'register',
#   sign_up: 'signup'
# }

  # Defines the root path route ("/")
  # root "posts#index"
end
