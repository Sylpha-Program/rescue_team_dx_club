Rails.application.routes.draw do

  get 'signup', to: 'users#new'
  resources :users, only: [:create, :show, :edit, :update, :destroy]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  root to: 'pokemons#index'
  resources :pokemons, only: [:new, :create, :edit, :update, :destroy]

end
