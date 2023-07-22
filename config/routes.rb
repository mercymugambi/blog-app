Rails.application.routes.draw do
  root "users#index"

  resources :users, only: [:index, :show] do
  resources :posts, only: [:index, :show, :new, :create] do
    resources :comments, only: [:new, :create]
  end
  end

  resources :posts, only: [] do
    resources :likes, only: [:create, :destroy]
  end
end 
