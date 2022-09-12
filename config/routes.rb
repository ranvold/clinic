Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :doctors
  devise_for :patients

  resources :appointments, only: [:index, :show, :new, :create, :edit, :update]
end
