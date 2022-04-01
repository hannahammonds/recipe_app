Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'index', to: 'recipes#index'
  
  resources :recipes
  
  get 'signup', to: 'users#new'
  resources :users, except: [:new]

end
