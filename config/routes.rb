# == Route Map
#
#                  Prefix Verb   URI Pattern                                                     Controller#Action
#     user_argument_votes GET    /users/:user_id/arguments/:argument_id/votes(.:format)          votes#index
#                         POST   /users/:user_id/arguments/:argument_id/votes(.:format)          votes#create
#  new_user_argument_vote GET    /users/:user_id/arguments/:argument_id/votes/new(.:format)      votes#new
# edit_user_argument_vote GET    /users/:user_id/arguments/:argument_id/votes/:id/edit(.:format) votes#edit
#      user_argument_vote GET    /users/:user_id/arguments/:argument_id/votes/:id(.:format)      votes#show
#                         PATCH  /users/:user_id/arguments/:argument_id/votes/:id(.:format)      votes#update
#                         PUT    /users/:user_id/arguments/:argument_id/votes/:id(.:format)      votes#update
#                         DELETE /users/:user_id/arguments/:argument_id/votes/:id(.:format)      votes#destroy
#          user_arguments GET    /users/:user_id/arguments(.:format)                             arguments#index
#                         POST   /users/:user_id/arguments(.:format)                             arguments#create
#       new_user_argument GET    /users/:user_id/arguments/new(.:format)                         arguments#new
#      edit_user_argument GET    /users/:user_id/arguments/:id/edit(.:format)                    arguments#edit
#           user_argument GET    /users/:user_id/arguments/:id(.:format)                         arguments#show
#                         PATCH  /users/:user_id/arguments/:id(.:format)                         arguments#update
#                         PUT    /users/:user_id/arguments/:id(.:format)                         arguments#update
#                         DELETE /users/:user_id/arguments/:id(.:format)                         arguments#destroy
#                   users GET    /users(.:format)                                                users#index
#                         POST   /users(.:format)                                                users#create
#                new_user GET    /users/new(.:format)                                            users#new
#               edit_user GET    /users/:id/edit(.:format)                                       users#edit
#                    user GET    /users/:id(.:format)                                            users#show
#                         PATCH  /users/:id(.:format)                                            users#update
#                         PUT    /users/:id(.:format)                                            users#update
#                         DELETE /users/:id(.:format)                                            users#destroy
#

Rails.application.routes.draw do

  root :to => 'arguments#index'

  resources :users do
   resources :arguments do
    resources :votes
    end
  end

end
