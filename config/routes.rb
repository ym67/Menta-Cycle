Rails.application.routes.draw do
  devise_for :users,
    controllers: {
      sessions: "users/sessions",
      registrations: "users/registrations",
      passwords: "users/passwords",
      # omniauth_callbacks: "users/omniauth_callbacks"
    }

  root 'big5_scores#index'

  resources :big5_scores

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
