Rails.application.routes.draw do
  devise_for :doctors
  devise_for :patients
  root to: 'home#index'
end
