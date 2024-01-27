Rails.application.routes.draw do
  resources :landlords, only: [:index, :show, :create, :update, :destroy]
  resources :houses, only: [:index, :show, :create, :update, :destroy]

  # custom routes for Landlord pages
  get "/landlord_me", to: "landlords#show"
  post "/signup_landlord", to: "landlords#create"
  post "/login_landlord", to: "landlord_session#create"
  delete "/logout_landlord", to: "landlord_session#destroy"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
