Rails.application.routes.draw do

  # API Routes
  namespace :api do
    resources :contact_requests, only: [:create]
    resources :projects, only: [:index]
    get 'resume' => 'resumes#index'
  end

  # Admin Routes
  resources :resumes do
    member do
      get :mark_as_active
    end
  end
  resources :contact_requests, only: [:index, :show, :delete, :update]
  resources :projects do
    member do
      get :toggle_status
    end
  end
  devise_for :users
  
  # Health Check Route
  get "up" => "rails/health#show", as: :rails_health_check

  # Root Route
  root 'resumes#index'
end
