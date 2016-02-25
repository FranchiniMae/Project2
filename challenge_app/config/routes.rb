Rails.application.routes.draw do
  #rooting to users#index just to test
  #REMEMBER to change to homepage!
  root to: "users#index"

  resources :users

  get "/sign_in", to: "sessions#new"
  post "/sessions", to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: "logout"

  resources :challenges

  get "/users/:user_id/challenges", to: "challenge_users#index", as: "user_challenges"
  post "/challenges/:challenge_id/users", to: "challenge_users#create", as: "challenge_users"
  #get users to show up on challenges

  resources :posts

end
