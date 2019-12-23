Rails.application.routes.draw do
  resources :halls
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  resources :users
  resources :films
  resources :seances
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'seances#index', as: :authenticated_root


  get '/registration' => 'users#new'
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :sessions, only: [:new, :create, :destroy]
end
