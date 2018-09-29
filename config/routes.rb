Rails.application.routes.draw do

 
  resources :playlists
  resources :profile
  devise_for :users
  get 'show/index'
  root 'welcome#index'
  post '/download', to: "welcome#download"
  post '/search', to: "welcome#search"
  get '/mp3', to: "show#mp3"
  get '/mp4', to: "show#mp4"
  get '/create', to: "show#create"
  get '/delete', to: "profile#delete"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
