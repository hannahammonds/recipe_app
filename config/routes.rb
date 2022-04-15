Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'index', to: 'recipes#index'
  
  resources :recipes
  
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :categories, except: [:destroy] 
  resources :kinds, except: [:destroy] 

end