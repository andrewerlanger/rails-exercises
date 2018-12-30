Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get root to: 'sessions#new'
  resources :students, only: [:index]
  resources :sessions, only: [:new, :create]
  resources :lessons, only: [:create, :show]
end
