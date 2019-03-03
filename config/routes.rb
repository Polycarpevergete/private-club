Rails.application.routes.draw do
  get 'sessions/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'static_pages#home'
  get '/enrollment', to: 'users#new'
  post '/enrollment', to: 'users#create'
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  get '/new', to: "posts#new"
  post '/new', to: "posts#create"
  delete '/logout', to: "sessions#destroy"
  
  resources :users
  resources :posts

end
