Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :accounts, only: [:create]
      resources :money_transfers, only: [:create]
    end
  end
end