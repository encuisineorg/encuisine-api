Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace :api do
    namespace :v1 do
      resources :foods, only: [:index, :show] do
        collection do
          resource :autocomplete, only: [:show], module: :foods
          resource :local, only: [:show], module: :foods
          resource :local_seasonal, only: [:show], module: :foods
          resource :seasonal, only: [:show], module: :foods
          resource :search, only: [:show], module: :foods
          resources :searches, only: [:create], module: :foods
        end
      end
      resources :recipes, only: [:index, :show, :create] do
        collection do
          resource :autocomplete, only: [:show], module: :recipes
          resource :search, only: [:show], module: :recipes
          resources :searches, only: [:create], module: :recipes
        end
      end
    end
  end
end
