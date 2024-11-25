Rails.application.routes.draw do

  # API Routes
  namespace :api do
    resources :contact_requests, only: [:create]
  end

  # Admin Routes
  resources :resumes
  resources :contact_requests, only: [:index, :show, :delete, :update]
  devise_for :users
  
  # Health Check Route
  get "up" => "rails/health#show", as: :rails_health_check

  # Root Route
  root 'resumes#index'
end
