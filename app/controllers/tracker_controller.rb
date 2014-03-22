class TrackerController < ApplicationController
	before_filter :authenticate_user!, only: [:index]
	
	def index
	end

	def target_front_end

		# Obtain all trips within the past 30 days
		all_trips_within_30 = Trip.where(date: (Time.now - 30.day)..Time.now)

		stats = {location_name: "", rating: 0, frequency: 0 }
		stat_holder = []
		all_trips_within_30.each do |trip|
			if stat_holder.include?(trip.location)
				stat_holder

		# location = ""
		# rating = 0
		# warhead = {}
		# payload = []



	end

end