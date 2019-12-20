
  
Rails.application.routes.draw do
  
  get 'sessions/new'

  root 'pages#index'
  get 'pages/help'

  resources :users
  resources :topics

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  get "favorites/index" 
  delete "/favorites", to: "favorites#destroy"
  post "/favorites", to: "favorites#create"
  
  get 'comments/new'
  post '/comments', to: 'comments#create'
  delete '/comments', to: 'comments#destroy'
  
  
end

