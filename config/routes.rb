Rails.application.routes.draw do
  namespace :api do
    resources :verification_tokens, only: [:create, :update], param: :token
    resource :user, only: [:show, :create, :update]
    resources :cities, only: [:index]
    resources :map_events, only: [:index]
    resources :memberships, only: [:index, :destroy]
    resources :events, only: [:show, :create, :update] do
      resources :memberships, only: [:index, :create], controller: 'event_memberships'
    end
    resources :sport_types, only: [:index] do
      resources :events, only: [:index]
    end
  end
end
