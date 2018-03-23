Rails.application.routes.draw do
  resources :walls, only: [:index, :show]
  resources :messages do
    resources :comments
  end
  resources :comments do
    resources :comments
  end
  devise_for :users, path: 'auth'
  root 'walls#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
