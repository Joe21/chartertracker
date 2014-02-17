Chartertracker::Application.routes.draw do  
  devise_for :users

  root :to => "home#home"

end
