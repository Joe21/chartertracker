class HomeController < ApplicationController
	before_filter :authenticate_user!, except: [:about, :funny]

	# Action used to render the home/landing page.
	def home
		# This process checks for new users, if so it "seeds" their account with all verified locations
		if current_user.locations.count == 0
			current_user.locations << Location.where(verified: true)
		end

		# Used to render the leaderboard. 
		@topten = User.order("trips_counter DESC").limit(10)
	end

	# Action used to render the about view. This action is excluded from the before_filter.
	def about
	end

	# Action used to render the funny view. This action is excluded from the before_filer.
	def funny
	end

end