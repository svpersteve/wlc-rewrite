Rails.application.routes.draw do
  root to: 'pages#home'
  resources :meetups do
    member do
      get :badges
    end
  end
  get '/past-meetups', to: 'meetups#past_meetups', as: 'past_meetups'
end
