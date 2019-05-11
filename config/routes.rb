Rails.application.routes.draw do
  resources :relationships, only: [:create, :destroy]
  resources :microposts, only: [:create, :destroy]
  resources :password_resets, onlu: [:new, :create, :edit, :update]
  resources :account_activations, only: [:edit]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  resources :users do
    member do 
      get :following, :followers
    end
  end

  root 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'

  get 'password_resets/new'
  get 'password_resets/edit'

  get 'sessions/new'
end
