Rails.application.routes.draw do

  get '/equipes/random', to: 'equipes#random'
  resources :partidas
  resources :equipes

  

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
