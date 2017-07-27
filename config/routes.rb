Rails.application.routes.draw do

	resources :attractions
	resources :users

	get '/', to: 'sessions#index', as: 'index'
	get '/signin', to: 'sessions#new', as: 'sign_in'
	post '/signin', to: 'sessions#create', as: 'authenticate'


	delete '/', to: 'sessions#destroy', as: 'logout'

	post '/rides/new', to: 'rides#create', as: 'new_ride'


end