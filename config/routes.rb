Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'recipes#index'
  get '/login', to: 'users#login', as: 'login'
  post '/login', to: 'users#in', as: 'in'
  resources :users, only: [:new,:create,:destroy]
  resources :recipes do
    resources :comments
  end


end
