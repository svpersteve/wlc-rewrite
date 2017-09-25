Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :members, controllers: { omniauth_callbacks: "callbacks", registrations: "registrations", passwords: "passwords", sessions: "sessions" }

  resources :members do
    member do
      get :update_email
    end
  end
end
