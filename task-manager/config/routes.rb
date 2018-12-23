Rails.application.routes.draw do
  # INDEX
  get 'tasks', to: 'tasks#index', as: :tasks

  # NEW
  get 'tasks/new', to: 'tasks#new', as: :new

  # SHOW
  get 'tasks/:id', to: 'tasks#show', as: :task

  # CREATE
  post 'tasks', to: 'tasks#create'

  # EDIT
  get 'tasks/edit/:id', to: 'tasks#edit', as: :edit

  # UPDATE
  patch 'tasks/:id', to: 'tasks#update'

  # DESTROY
  delete 'tasks/:id', to: 'tasks#destroy'

end
