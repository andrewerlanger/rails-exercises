Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get root to: 'cocktails#index'
  resources :cocktails, except: [:edit, :update] do
    resources :doses, only: [:new, :create, :destroy]
  end
end
