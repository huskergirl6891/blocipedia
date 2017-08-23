Rails.application.routes.draw do

  devise_for :users
  get 'welcome/index'

  root 'welcome#index'

  resources :wikis

  resources :charges, only: [:new, :create, :destroy]

end
