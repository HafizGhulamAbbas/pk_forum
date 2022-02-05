Rails.application.routes.draw do
  resources :mcqs
  get 'mcqs/index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # root to: 'posts#index'
  root to: 'sessions#welcome'

  resources :posts do
    collection do
      get :import_json_file
    end
  end

  post 'posts/:id/likes', to: 'likes#create', as: 'like'
  delete 'likes/:id', to: 'likes#destroy', as: 'liked'
  

  resources :users, only: %i[index new create edit update]
  get 'users', to: 'users#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'home', to: 'sessions#home'
  get 'coming-soon', to: 'sessions#coming_soon'
  get 'logout', to: 'sessions#logout'

  get 'css-faqs', to: 'faqs#css'
  get 'fpsc-faqs', to: 'faqs#fpsc'
  get 'ppsc-faqs', to: 'faqs#ppsc'
  get 'kppsc-faqs', to: 'faqs#kppsc'
  get 'spsc-faqs', to: 'faqs#spsc'
  get 'bpsc-faqs', to: 'faqs#bpsc'
  get 'nts-faqs', to: 'faqs#nts'
  get 'pts-faqs', to: 'faqs#pts'
  get 'ots-faqs', to: 'faqs#ots'

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
