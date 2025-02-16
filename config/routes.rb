Rails.application.routes.draw do
  root 'books#index'
  
  # Authentication routes (provided by Rails)
  devise_for :users
  
  resources :books do
    member do
      post 'borrow'
      post 'return'
    end
  end
  
  get 'profile', to: 'users#profile'
end 