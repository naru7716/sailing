Rails.application.routes.draw do
  get 'sessions/new'
  root 'static_pages#home'
  get :about,        to: 'static_pages#about'
  get :signup,       to: 'users#new'
  get :login,        to: 'sessoin#new'
  get :login,        to: 'session#create'
  get :login,        to: 'sessoin#destroy'
  resources :users
end