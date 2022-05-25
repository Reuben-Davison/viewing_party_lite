Rails.application.routes.draw do
  get "/register", to: 'users#new'
  get '/dashboard', to: 'users#show'
  post '/users', to: 'users#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  get '/dashboard', to: 'users#show'

  get '/discover', to: 'users#discover'
  get '/movies/:id', to: 'movies#movie_details'
  get '/movies/:id/viewing-party/new', to: 'viewing_parties#new'
  post '/movies/:movie_id/viewing-party', to: 'viewing_parties#create'

  get '/movies/top_movies', to: 'movies#top_movies'
  get '/movies/search_results', to: 'movies#search_results'

  get '/login', to:'users#login_form'
  post '/login', to:'users#login_user'

end
