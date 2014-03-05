class HomeController < ApplicationController
	before_filter :authenticate_user!, only: [:home] 

	def home
		# [Validation: This process checks for new users, if so, all verified locations are linked to their account]
		if current_user.locations == 0
			current_user.locations << Location.where(verified: true)
		end
	end

end