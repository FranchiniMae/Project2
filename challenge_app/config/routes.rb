Rails.application.routes.draw do
  #rooting to users#index just to test
  #REMEMBER to change to homepage!
  root to: "users#index"

  get "/users", to: "users#index", as: "users"
  get "/users/new", to: "users#new", as: "new_user"
  post "/users", to: "users#create"
  get "/users/:id", to: "users#show"

  get "/sign_in", to: "sessions#new"
  post "/sessions", to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: "logout"

  resources :challenges

  get "/users/:user_id/challenges", to: "challenge_users#index", as: "user_challenges"
  #get users to show up on challenges

  resources :posts

end
