Rails.application.routes.draw do
  get 'register', to: 'users#new', as: 'register'
  resources :users, only: %i[index create destroy]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get '/users/verify', to: 'users#verify_email', as: 'verification'
end
