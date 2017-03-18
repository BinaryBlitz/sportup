Rails.application.routes.draw do
  namespace :api do
    resources :verification_tokens, only: [:create, :update], param: :token
    resource :user, only: [:show, :create, :update]
    resources :cities, only: [:index]
    resources :sport_types, only: [:index]
    resources :events, only: [:show, :create, :update]
  end
end
