Rails.application.routes.draw do
  devise_for :users
  resources :courses do
    resources :lessons
  end
  resources :users, only: [:index, :edit, :show, :update]
  get 'pages/index'
  get 'pages/activity'
  root 'pages#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
