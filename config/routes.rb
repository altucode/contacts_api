Rails.application.routes.draw do
  resources :users, only: [:index, :create, :destroy, :show, :update] do
    member { get 'favorites' }
    resources :contacts, only: [:index]
    resources :comments, only: [:index, :create]
    resources :groups, only: [:index, :create]
  end
  resources :contacts, only: [:create, :destroy, :show, :update] do
    resources :comments, only: [:index, :create]
  end
  resources :contact_shares, only: [:create, :destroy]

  resources :comments, only: [:show, :update, :destroy]

  resources :groups, only: [:show, :update, :destroy] do
    member { get 'contacts' }
    member { post 'add_member'}
  end

end
