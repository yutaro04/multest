Rails.application.routes.draw do
  devise_for :students
  devise_for :admins
  root 'homes#index'
  resources :student
  namespace :student do
    resources :tests, only: [:index,:show]
  end
  resources :admin
  namespace :admin do
    resources :students, only: [:index,:show]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end