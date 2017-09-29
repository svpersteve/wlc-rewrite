Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :members, controllers: { omniauth_callbacks: "callbacks", registrations: "registrations", passwords: "passwords", sessions: "sessions" }

  resources :members do
    member do
      get :update_email
    end
    resources :notes do
      member do
        get :delete
      end
    end
  end

  resources :hackrooms do
    member do
      get :members
      get :join
    end
  end

  resources :meetups do
    member do
      get :badges
    end
  end
  get '/past-meetups', to: 'meetups#past_meetups', as: 'past_meetups'

  resources :notes, only: :index

  namespace :api do
    namespace :v1 do
      resources :meetups, only: [:index, :show]
      resources :members, only: [:index, :show, :update] do
        get :notes
      end
      resources :hackrooms, only: [:index, :show, :update]
    end
  end
end
