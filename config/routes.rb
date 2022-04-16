Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  #SUPERADMIN FEATURES
  namespace :admin do
    resources :congregations
    resources :users, except: [:show] do
      resources :roles, only: [:index, :create, :destroy]
    end
  end

end
