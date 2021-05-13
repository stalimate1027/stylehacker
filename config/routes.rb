Rails.application.routes.draw do
  devise_for :users
  root to: "schedules#index"
  resources :schedules do
    resources :sub_schedules
    resources :comments, only: :create
  end
  resources :users,only: :show
end
