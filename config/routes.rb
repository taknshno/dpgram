Rails.application.routes.draw do
  get 'sessions/new'
  root to: 'pictures#index'

  resources :pictures do
    collection do
      post :confirm
    end
  end

  resources :users, only: [:new, :create, :show, :edit, :update]
end
