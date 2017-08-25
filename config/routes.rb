Rails.application.routes.draw do

  devise_for :users
  get 'welcome/index'

  root 'welcome#index'

  resources :wikis do
    resources :collaborators
  end

  resources :charges, only: [:new, :create, :destroy]



end
