Rails.application.routes.draw do
  root "tasks#index"
  devise_for :users
  # post '/tasks/guest_sign_in', to: 'homes#new_guest'

  

  resources :users, only: [:edit, :update, :destroy]
  resources :tasks, only: [:index,:new,:create,:show,:destroy] do
    collection do
      get 'search'
    end
    resources :todos,only: [:index,:new,:create,:destroy] 
  end
end
