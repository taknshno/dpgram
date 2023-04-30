Rails.application.routes.draw do
  root to: 'pictures#index'

  resources :pictures do
    collection do
      post :confirm
    end
  end

  resources :users do
    member do
      get :fav_index
    end
  end

  resources :sessions, only: [:new, :create, :destroy]
  resources :favorites, only: [:create, :destroy]
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
