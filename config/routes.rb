Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'recipes#index'
  get '/login', to: 'users#login', as: 'login'
  post '/login', to: 'users#in', as: 'in'
  get '/logout', to: 'users#destroy', as: 'logout'
  get '/caterer_login', to: 'caterers#caterer_login', as: 'caterer_login'
  post '/caterer_login', to: 'caterers#caterer_in', as: 'caterer_in'
  get '/caterer_logout', to: 'caterers#destroy', as: 'caterer_logout'
  get '/auth/facebook/callback', to: 'sessions#create'
  get '/auth/github/callback', to: 'sessions#create'
  get '/personal', to: 'users#personal'
  get '/fast', to: 'recipes#fast'
  post '/setup/:id', to: 'caterers#setup', as: 'setup'
  get '/contacts', to: 'caterers#contacts'
  resources :caterers, only: [:new,:create,:destroy]
  resources :users, only: [:new,:create,:destroy]
  resources :recipes do
    resources :comments
  end

end
