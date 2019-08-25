Rails.application.routes.draw do
  devise_for :users
  get 'reviews/new'
  # root to: 'cocktails#home'
  root to: 'cocktails#index'
  # resources :cocktails, only: [:index, :show, :new]
  resources :cocktails do
    resources :doses, only: [:new, :create, :destroy]
  end
  resources :doses, only: [:destroy]
end
