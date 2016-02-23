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

  # get "/challenges", to: "challenges#index"
  # get "/challenges/new", to: "challenges#new", as: "new_challenge"
  # post "/challenges", to: "challenges#create"
  # get "/challenges/:id/edit", to: "challenges#edit"
  # get "/challenges/:id", to: "challenges#show", as: "challenge_path"
  # put "/challenges/:id", to: "challenges#update"

  resources :challenges
  resources :posts

end
