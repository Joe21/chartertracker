Chartertracker::Application.routes.draw do  
  devise_for :users  
  resources :users do
	  resources :locations
	end

  root :to => "home#home"

##### [Rake Routes] #####

#         new_user_session GET    /users/sign_in(.:format)                     devise/sessions#new
#             user_session POST   /users/sign_in(.:format)                     devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)                    devise/sessions#destroy
#            user_password POST   /users/password(.:format)                    devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)                devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)               devise/passwords#edit
#                          PUT    /users/password(.:format)                    devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)                      devise/registrations#cancel
#        user_registration POST   /users(.:format)                             devise/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)                     devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)                        devise/registrations#edit
#                          PUT    /users(.:format)                             devise/registrations#update
#                          DELETE /users(.:format)                             devise/registrations#destroy
#           user_locations GET    /users/:user_id/locations(.:format)          locations#index
#                          POST   /users/:user_id/locations(.:format)          locations#create
#        new_user_location GET    /users/:user_id/locations/new(.:format)      locations#new
#       edit_user_location GET    /users/:user_id/locations/:id/edit(.:format) locations#edit
#            user_location GET    /users/:user_id/locations/:id(.:format)      locations#show
#                          PUT    /users/:user_id/locations/:id(.:format)      locations#update
#                          DELETE /users/:user_id/locations/:id(.:format)      locations#destroy
#                    users GET    /users(.:format)                             users#index
#                          POST   /users(.:format)                             users#create
#                 new_user GET    /users/new(.:format)                         users#new
#                edit_user GET    /users/:id/edit(.:format)                    users#edit
#                     user GET    /users/:id(.:format)                         users#show
#                          PUT    /users/:id(.:format)                         users#update
#                          DELETE /users/:id(.:format)                         users#destroy
#                     root        /                                            home#home
end
