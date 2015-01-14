Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :orders, only: [:index, :show, :edit, :update, :create, :new]

  namespace :admin do
    resources :orders
  end
end
