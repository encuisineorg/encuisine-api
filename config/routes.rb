Rails.application.routes.draw do
  resources :foods, only: [:show]
  namespace :foods do
    resources :searches, only: [:create]
  end
end
