Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'home#index'

  devise_for :doctors
  devise_for :patients

  resources :appointments, only: [:index, :show, :new, :create, :edit, :update]
end
