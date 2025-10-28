Rails.application.routes.draw do

  # Testing route
  get 'hello', to: 'application#hello'

  root 'login/login#index'

  resources :login, to: 'login/login#index', only: [:index, :create], path_names: { index: "getLogin", create: "postLogin"}#, as: "sample"
  resources :photos#, path_names: { new: "make", edit: "change" }

  get 'hello', to: 'application#hello'

  get 'sample_list', to: 'login/login#sample_list'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
  namespace :api do
    namespace :v1 do
      resources :sessions, only: [:create]
    end
  end
end
