class TrackerController < ApplicationController
	
	# Action used to render the chart view.
	def chart
		###########################################
		# Arming json warhead for past 30 days
		###########################################
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

		warhead_thirty= []
		data.each do |object|
			warhead_thirty << {name: object[:name], avg: (object[:total].to_f / object[:frequency]).round(1)}
		end
		
		###########################################
		### Arming json warhead for past 7 days ###
		###########################################
		all_trips_within_7 = Trip.where(date: (Time.now - 7.day)..Time.now)

		locations7 = []
		all_trips_within_7.each do |trip|
			locations7 << {name: trip.location.name, rating: trip.rating, total: trip.rating, frequency: 1}
		end

		# Sort query by location names alphabetically
		locations7.sort! { |a, b| a[:name] <=> b[:name] }

		# Create variables required to identify duplicates and store their values
		unique_names7 = []
		data7 = []

		# Nested iteration. Data will be fed only for unique location names. If not, the data object itself will be found and updated.
		locations7.each do |object|
			unless unique_names7.include?(object[:name])
				data7 << {name: object[:name], total: object[:rating], frequency: 1}
				unique_names7 << object[:name]
			else
				for i in data7
					if i[:name] == object[:name]
						i[:total] += object[:rating]
						i[:frequency] += 1
					end
				end
			end
		end

		warhead_seven= []
		data7.each do |object|
			warhead_seven << {name: object[:name], avg: (object[:total].to_f / object[:frequency]).round(1)}
		end

		# Missile is armed with both warheads in an array.
		missile = []
		missile << warhead_seven
		missile << warhead_thirty

		# Server listens for and responds to json requests by rendering the missile array in json format.
		respond_to do |format|
			format.html
			format.json {render :json => missile.to_json}
		end

	end
end