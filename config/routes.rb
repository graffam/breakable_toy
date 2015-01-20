Rails.application.routes.draw do
  devise_scope :user do
    root to: "landings#index"
  end

  devise_for :users

  resources :orders, only: [:index, :show, :edit, :update, :create, :new]

  resources :metrics

  namespace :admin do
    resources :orders
    resources :users
  end
end
