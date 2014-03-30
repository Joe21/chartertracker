class TrackerController < ApplicationController
	
	def chart
		all_trips_within_30 = Trip.where(date: (Time.now - 30.day)..Time.now)

		locations = []
		all_trips_within_30.each do |trip|
			locations << {name: trip.location.name, rating: trip.rating, total: trip.rating, frequency: 1}
		end

		# Sort query by location names alphabetically
		locations.sort! { |a, b| a[:name] <=> b[:name] }

		# Create variables required to identify duplicates and store their values
		unique_names = []
		data = []

		# Nested iteration. Data will be fed only for unique location names. If not, the data object itself will be found and updated.
		locations.each do |object|
			unless unique_names.include?(object[:name])
				data << {name: object[:name], total: object[:rating], frequency: 1}
				unique_names << object[:name]
			else
				for i in data
					if i[:name] == object[:name]
						i[:total] += object[:rating]
						i[:frequency] += 1
					end
				end
			end
		end

		warhead = []
		data.each do |object|
			warhead << {name: object[:name], avg: (object[:total].to_f / object[:frequency]).round(1)}
		end

		respond_to do |format|
			format.html
			format.json {render :json => warhead.to_json}
		end
	end
end