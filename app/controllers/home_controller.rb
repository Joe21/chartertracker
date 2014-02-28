class HomeController < ApplicationController
	before_filter :authenticate_user!, only: [:home]

	def home
		# [VALIDATION] Check's for a new user's empty locations and seeds with all locations in the database.  
		if current_user.locations.count == 0
			current_user.locations << Location.all
		end 
	end

end