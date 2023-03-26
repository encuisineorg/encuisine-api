Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace :api do
    namespace :v1 do
      resources :foods, only: [:index, :show]
      namespace :foods do
        resources :searches, only: [:create]
      end
      resources :recipes, only: [:index, :show, :create]
      namespace :recipes do
        resources :searches, only: [:create]
      end
    end
  end
end
