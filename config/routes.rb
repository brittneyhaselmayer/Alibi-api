Rails.application.routes.draw do
resources :users, :alibis, :events, :meetups, :pendings
   post '/login', to: 'auth#create'
   get '/profile', to: 'users#profile'

end
