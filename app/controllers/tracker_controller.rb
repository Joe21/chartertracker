class TrackerController < ApplicationController
	before_filter :authenticate_user!, only: [:index]
	
	def index
		@trips_within_30_days = current_user.trips.where(date: (Time.now - 30.day)..Time.now)
	end

	def fire_for_effect
	end

end