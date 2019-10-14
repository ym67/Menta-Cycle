Rails.application.routes.draw do
  root 'big5_scores#index'

  resources :big5_scores
end
