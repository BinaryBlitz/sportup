Rails.application.routes.draw do
  mount ActionCable.server, at: '/cable'

  namespace :api do
    resources :verification_tokens, only: [:create, :update], param: :token
    resource :user, only: [:show, :create, :update]
    resources :memberships, only: [:index, :destroy]
    resources :invites, only: [:index, :update, :destroy]

    resources :events, except: [:index, :new, :edit] do
      resources :memberships, only: [:index, :create], controller: 'event_memberships'
      resources :invites, only: [:create]
      resources :votes, only: [:create]
      resources :reports, only: [:index, :create]
      resources :teams, only: [:create, :update]
      resources :messages, only: [:index, :create]
    end

    resources :sport_types, only: [:index] do
      resources :events, only: [:index]
    end
  end
end
