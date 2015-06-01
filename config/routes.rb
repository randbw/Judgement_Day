# == Route Map
#
#        Prefix Verb   URI Pattern                   Controller#Action
#          root GET    /                             arguments#index
#         votes GET    /votes(.:format)              votes#index
#               POST   /votes(.:format)              votes#create
#      new_vote GET    /votes/new(.:format)          votes#new
#     edit_vote GET    /votes/:id/edit(.:format)     votes#edit
#          vote GET    /votes/:id(.:format)          votes#show
#               PATCH  /votes/:id(.:format)          votes#update
#               PUT    /votes/:id(.:format)          votes#update
#               DELETE /votes/:id(.:format)          votes#destroy
#     arguments GET    /arguments(.:format)          arguments#index
#               POST   /arguments(.:format)          arguments#create
#  new_argument GET    /arguments/new(.:format)      arguments#new
# edit_argument GET    /arguments/:id/edit(.:format) arguments#edit
#      argument GET    /arguments/:id(.:format)      arguments#show
#               PATCH  /arguments/:id(.:format)      arguments#update
#               PUT    /arguments/:id(.:format)      arguments#update
#               DELETE /arguments/:id(.:format)      arguments#destroy
#         users GET    /users(.:format)              users#index
#               POST   /users(.:format)              users#create
#      new_user GET    /users/new(.:format)          users#new
#     edit_user GET    /users/:id/edit(.:format)     users#edit
#          user GET    /users/:id(.:format)          users#show
#               PATCH  /users/:id(.:format)          users#update
#               PUT    /users/:id(.:format)          users#update
#               DELETE /users/:id(.:format)          users#destroy
#         login GET    /login(.:format)              session#new
#               POST   /login(.:format)              session#create
#               DELETE /login(.:format)              session#destroy
#

Rails.application.routes.draw do

  root :to => 'arguments#index'

  resources :votes
  resources :arguments
  resources :users

  
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

end
