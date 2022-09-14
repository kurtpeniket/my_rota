Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'join_event(/:id)(/:token)', to: 'events#join_congregation' # this is wrong, event is not in this project?
  post '/bot', to: 'bot#webhook'
  post '/callback', to: 'bot#callback'

  # Admin
  namespace :admin do
    resources :congregations
    resources :users, except: [:show] do
      resources :roles, only: [:index, :create, :destroy]
    end
    resources :rotas
  end

end
