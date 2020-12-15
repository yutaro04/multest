Rails.application.routes.draw do
  devise_for :students
  devise_for :admins
  root 'homes#index'
  namespace :students do
    resources :tests, only: [:new,:show,:create,:destroy]
    get "top",to: "tests#top"
  end
  resources :students
  resources :admins
  namespace :admins do
    resources :students, only: [:index,:show]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end