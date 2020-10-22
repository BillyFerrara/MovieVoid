Rails.application.routes.draw do
  resources :movies
  resources :users

  # http request     controller       path
  get "signup", to: "users#new", as: "signup"
  get "login", to: "sessions#new", as: "login"
  post "sessions", to: "sessions#create", as: "sessions"
end
