class TrackerController < ApplicationController
	before_filter :authenticate_user!, only: [:index, :target_front_end]
	
	def index
	end

	def target_front_end
		all_trips_within_30 = Trip.where(date: (Time.now - 30.day)..Time.now)

		@locations = []
		all_trips_within_30.each do |trip|
			@locations << {name: trip.location.name, rating: trip.rating, total: trip.rating, frequency: 1}
		end

		array = []
		@locations.each do |object|
			for i in array
				if i[:name] == object[:name]
					i[:total] += object[:rating]
					i[:frequency] += 1
					@locations.delete(object)
				end
			end
			array << object
		end

		@data = []
		@locations.each do |object|
			@data << {name: object[:name], rating: object[:total] / object[:frequency].round(1)}
		end
	end
end