class HomeController < ApplicationController
	before_filter :authenticate_user!, only: [:home] 

	def home
		# [Validation: This process checks for new users, if so, all verified locations are linked to their account]
		if current_user.locations == 0
			current_user.locations << Location.where(verified= true)
			current_user.locations.save
		end

		if current_user.admin == true
			@all_users_count = User.count
			@pending_locations_count = Location.where(verified: false).count
		end

	end

end