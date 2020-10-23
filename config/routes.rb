Rails.application.routes.draw do
  resources :reviews
  resources :movies
  resources :users

  # http request     controller       path
  get "signup", to: "users#new", as: "signup"
  get "login", to: "sessions#new", as: "login"
  post "sessions", to: "sessions#create", as: "sessions"

  delete "sessions", to: "sessions#destroy", as: "logout"
end 