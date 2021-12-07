Rails.application.routes.draw do
  resources :mcqs
  get 'mcqs/index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'posts#index'

  resources :posts do
    collection do
      get :import_json_file
    end
  end

  resources :users, only: %i[create update]

  # resources :settings, only: %i[new create edit update]
  # resources :dashboard, only: [:index]
  # resources :notifications, only: %i[index destroy]
  # resources :messages, only: %i[index show update destroy]
  resources :visitors, only: %i[index destroy]
  resources :comments, only: %i[index update destroy]
  # resources :tags, except: [:index]
  # resources :sessions, only: %i[new create destroy]
  # resources :moderators, only: %i[index edit update]

  # resources :posts, only: %i[index show]
  # resources :messages, only: %i[new create]
  resources :comments, only: [:create]
end
