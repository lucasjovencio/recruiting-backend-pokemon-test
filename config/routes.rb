Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, param: :id
  resources :pokedexes, param: :id
  post '/auth/login', to: 'authentication#login'
end
