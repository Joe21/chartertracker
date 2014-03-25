Chartertracker::Application.routes.draw do  
  devise_for :users  

	post 'locations/:id/add' => 'locations#add_to_my_location', :as => 'add_to_my_location'
  post 'locations/:id/remove' => 'locations#remove_from_my_location', :as => 'remove_from_my_location'
  get 'locations/:id/trips/new' => 'trips#new', :as => 'new_trip'
  post 'trips/:id/delete' => 'trips#destroy', :as => 'delete_trip'
  get 'tracker' => 'tracker#index', :as => 'tracker'

  resources :locations
  resources :trips

  root :to => "home#home"  

  get 'tracker/test' => 'tracker#target_front_end'

# [Rake Routes]
###################################
#### Devise controller/actions ####
###################################
#         new_user_session GET    /users/sign_in(.:format)           devise/sessions#new
#             user_session POST   /users/sign_in(.:format)           devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)          devise/sessions#destroy
#            user_password POST   /users/password(.:format)          devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)      devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)     devise/passwords#edit
#                          PUT    /users/password(.:format)          devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)            devise/registrations#cancel
#        user_registration POST   /users(.:format)                   devise/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)           devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)              devise/registrations#edit
#                          PUT    /users(.:format)                   devise/registrations#update
#                          DELETE /users(.:format)                   devise/registrations#destroy

###################################
###### My controller/actions ######
###################################
#       add_to_my_location POST   /locations/:id/add(.:format)       locations#add_to_my_location
#  remove_from_my_location POST   /locations/:id/remove(.:format)    locations#remove_from_my_location
#                 new_trip GET    /locations/:id/trips/new(.:format) trips#new
#                locations GET    /locations(.:format)               locations#index
#                          POST   /locations(.:format)               locations#create
#             new_location GET    /locations/new(.:format)           locations#new
#            edit_location GET    /locations/:id/edit(.:format)      locations#edit
#                 location GET    /locations/:id(.:format)           locations#show
#                          PUT    /locations/:id(.:format)           locations#update
#                          DELETE /locations/:id(.:format)           locations#destroy
#                    trips GET    /trips(.:format)                   trips#index
#                          POST   /trips(.:format)                   trips#create
#                          GET    /trips/new(.:format)               trips#new
#                edit_trip GET    /trips/:id/edit(.:format)          trips#edit
#                     trip GET    /trips/:id(.:format)               trips#show
#                          PUT    /trips/:id(.:format)               trips#update
#                          DELETE /trips/:id(.:format)               trips#destroy
#              delete_trip POST   /trips/:id/delete(.:format)        trips#destroy
#                     root        /                                  home#home

end