Rails.application.routes.draw do
  devise_for :users
  root to: 'users#show'
  resources :challenges, only: [:new, :create, :show] do
    member do
      get :join
      post :started
    end
  end
  resources :participations, only: [:show, :create]
  resources :progressions, only: [] do
    post :done, on: :member
  end
end
