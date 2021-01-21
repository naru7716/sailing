Rails.application.routes.draw do
  get 'sessions/new'
  root 'static_pages#home'
  get :about,        to: 'static_pages#about'
  get :signup,       to: 'users#new'
  get :login,        to: 'sessions#new'
  post :login,       to: 'sessions#create'
  delete :logout,    to: 'sessions#destroy'
  get :favorites,    to: 'favorites#index'
  post   "favorites/:micropost_id/create"  => "favorites#create"
  delete "favorites/:micropost_id/destroy" => "favorites#destroy"
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :microposts
  resources :relationships, only: [:create, :destroy]
  resources :comments,      only: [:create, :destroy]
  resources :notifications, only: :index
end