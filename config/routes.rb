Rails.application.routes.draw do
  get "about", to: "about#index"

  root to: "main#index"

  get "password", to: "password#edit"
  patch "password", to: "password#update"

  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  get "password/reset", to: "password_resets#new"
  post "password/reset", to: "password_resets#create"
  get "password/reset/edit", to: "password_resets#edit"
  patch "password/reset/edit", to: "password_resets#update"

  get "/auth/twitter/callback", to: "omniauth_callback#twitter"
  post "/auth/twitter/callback", to: "omniauth_callback#twitter"

  resources :twitter_accounts
  resources :tweets

end
