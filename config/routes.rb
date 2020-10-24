Rails.application.routes.draw do
  resources :movies
  resources :reviews

  resources :users do 
    resources :reviews
    resources :movies
  end 

  # http request     controller       path
  get "signup", to: "users#new", as: "signup"
  get "login", to: "sessions#new", as: "login"
  post "sessions", to: "sessions#create", as: "sessions"

  patch 'reviews/:id', to: 'reviews#update'

  get "homepage", to: "home#index", as: "homepage"
  

  delete "sessions", to: "sessions#destroy", as: "logout"

  root 'home#index'

end 