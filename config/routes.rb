Rails.application.routes.draw do
  resources :users, only: [:index, :create, :destroy, :show, :update]
  resources :contacts, only: [:index, :create, :destroy, :show, :update]
end
