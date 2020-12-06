Rails.application.routes.draw do
  get 'users/show'
  get 'users/new'
  get 'users/create'
  get 'users/edit'
  get 'users/update'
  get 'users/destroy'
  get 'toppages/index'
  root to: 'toppages#index'
  
  get 'signup' ,to: 'users#new'
  resources :users ,only:[:show,:new,:create,:edit,:update,:destroy]
  
  get 'login' ,to: 'sessions#new'
  post 'login',to: 'sessions#create'
  delete'logout',to: 'sessions#destroy'
  
  resources:posts
end
