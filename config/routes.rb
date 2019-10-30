Rails.application.routes.draw do
  root 'users#show'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  devise_for :users,
    controllers: {
      # confirmations:      "users/confirmations",
      # omniauth_callbacks: "users/omniauth_callbacks",
      passwords:          "users/passwords",
      registrations:      "users/registrations",
      sessions:           "users/sessions",
      # unlocks:            "users/unlocks"
    }
  get '/dailry_data' ,to: 'users#dailry_data'
  resources :users
  resources :pss4s
  resources :ssses
  resources :big5_scores
  resources :stress_diaries
  resources :contacts
end
