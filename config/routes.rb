RedditClone::Application.routes.draw do


  devise_for :users

  root to: 'pages#index'
  resources :pages
  resources :links
  resources :comments
  resources :votes

end
