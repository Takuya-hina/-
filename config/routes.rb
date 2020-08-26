Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'search', to: 'toppages#search', as: :search
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create]do
    member do
      get :likes
    end
  end
  resources:cmposts do
    member do
      get :ranks
    end
  end
  resources :likes, only: [:create, :destroy]
 
end
