Rails.application.routes.draw do
  resources :invite_venues
  resources :invite_performers
  resources :attends
  resources :follow_places
  resources :follow_people
  resources :gigs
  resources :venues
  resources :performers
  resources :users

  post "/login", to: "auth#login"
  post "/signup", to: "auth#signup"
  get "/auto_login", to: "auth#auto_login"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
