Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get root to: 'sessions#new'
  # resources :students, only: [:index]
  # resources :sessions, only: [:new, :create] do
  #   resources :students, only: [:index]
  #   resources :lessons, only: [:create, :show]
  # end
  # resources :sessions, only: [:new, :create]
  # resources :lessons, only: [:create, :show]


# get '/patients/:id', to: 'patients#show'

  # sessions/create
  post '/', to: 'sessions#create', as: 'sessions'

  # students/index
  get '/:session_id/students', to: 'students#index', as: 'students'

  # lessons/create
  post '/:session_id/lessons', to: 'lessons#create', as: 'lessons'

  # lessons/show
  get '/:session_id/lessons/:lesson_number', to: 'lessons#show', as: 'lesson'
end
