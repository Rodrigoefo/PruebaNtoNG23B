Rails.application.routes.draw do
  resources :tasks, only: [:index, :show]
  get 'completed/:id', to: 'tasks#completed', as: 'task_completed'
  devise_for :users




  root to: "tasks#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
