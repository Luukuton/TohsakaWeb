Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/failure'

  post '/login', :to => 'sessions#new', :as => :login
  get '/logout', :to => 'sessions#destroy', :as => :logout

  match '/auth/:provider/callback', :to => 'sessions#create', :via => [:get, :post]
  match '/auth/failure', :to => 'sessions#failure', :via => [:get, :post]

  get "/api", to: "application#api"
  get "/settings", to: "application#settings"

  resources :users
  resources :reminders
  resources :triggers
  resources :highlights
  resources :linkeds

  scope "/api/v1", defaults: {format: :json} do
    resources :reminders
    resources :triggers
    resources :highlights
    resources :linkeds
  end

  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
