Rails.application.routes.draw do
  root "tasks#index"
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  
  resources :users, only: [:edit, :update, :destroy]
  resources :tasks, only: [:index,:new,:create,:show,:destroy] do
    collection do
      get 'search'
    end
    resources :todos,only: [:index,:new,:create,:destroy] 
  end
end
