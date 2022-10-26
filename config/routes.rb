Rails.application.routes.draw do
  get 'api/imdb'
  resources :ratings
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "ratings#index"
end
