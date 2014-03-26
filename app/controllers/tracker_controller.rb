class TrackerController < ApplicationController
	before_filter :authenticate_user!, only: [:chart]
	
	def chart
		all_trips_within_30 = Trip.where(date: (Time.now - 30.day)..Time.now)

		locations = []
		all_trips_within_30.each do |trip|
			locations << {name: trip.location.name, rating: trip.rating, total: trip.rating, frequency: 1}
		end

		array = []
		locations.each do |object|
			for i in array
				if i[:name] == object[:name]
					i[:total] += object[:rating]
					i[:frequency] += 1
					locations.delete(object)
				end
			end
			array << object
		end

		warhead = []
		locations.each do |object|
			warhead << {name: object[:name], avg: (object[:total] / object[:frequency]).to_f.round(1)}
		end

		respond_to do |format|
			format.html
			format.json {render :json => warhead.to_json}
		end
	end

	def test
		all_trips_within_30 = Trip.where(date: (Time.now - 30.day)..Time.now)

		@initial = []

		@locations = []
		all_trips_within_30.each do |trip|
			@locations << {name: trip.location.name, rating: trip.rating, total: trip.rating, frequency: 1}
			@initial << {name: trip.location.name, rating: trip.rating, total: trip.rating, frequency: 1}
		end

		# this works to sort the array of hashes
		@initial.sort! { |a, b| a[:name] <=> b[:name] }
		@locations.sort! { |a, b| a[:name] <=> b[:name] }

		@array = []
		@locations.each do |object|
			for i in @array
				if i[:name] == object[:name]
					i[:total] += object[:rating]
					i[:frequency] += 1
					@locations.delete(object)
				end
			end
			@array << object
		end

		@warhead = []
		@locations.each do |object|
			@warhead << {name: object[:name], avg: (object[:total] / object[:frequency]).round(1)}
		end


	end

end