Rails.application.routes.draw do
  get "/register", to: 'users#new'
  get '/users/:id', to: 'users#show'
  post '/users', to: 'users#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  get 'users/:id', to: 'users#show'

  get 'users/:id/discover', to: 'users#discover'
  get 'users/:id/movies/:id', to: 'movies#movie_details'
  get 'users/:user_id/movies/:id/viewing-party/new', to: 'viewing_parties#new'
  post 'users/:id/movies/:id/viewing-party', to: 'viewing_parties#create'

  get '/movies/top_movies', to: 'movies#top_movies'
  get '/movies/search_results', to: 'movies#search_results'

  get '/login', to:'users#login_form'

end
