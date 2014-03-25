class TrackerController < ApplicationController
	before_filter :authenticate_user!, only: [:index, :target_front_end]
	
	def index
		# Obtain all trips within the past 30 days
		# all_trips_within_30 = Trip.where(date: (Time.now - 30.day)..Time.now)

		# data = []
		# all_trips_within_30.each do |trip|
		# 	object = Hash.new
		# 	object["name"] = trip.location
		# 	object["rating"] = trip.rating
		# 	data << object
		# end
		#  puts "-------------------"
		#  puts "-------------------"
		#  puts data.each
		#  puts "-------------------"

	end

	def target_front_end
		all_trips_within_30 = Trip.where(date: (Time.now - 30.day)..Time.now)
		array = []
		array = all_trips_within_30.each do |trip|
			array << {name: trip.location.name, rating: trip.rating }
		end

		holder = []

		array.each do |element|
		end


	end




		# Obtain all trips within the past 30 days
		# all_trips_within_30 = Trip.where(date: (Time.now - 30.day)..Time.now)

		# method 1
		# @data = []
		# all_trips_within_30.each do |trip|
		# 	object = Hash.new
		# 	object["name"] = trip.location.name
		# 	object["rating"] = trip.rating
		# 	object["frequency"] = 0
		# 	object["avg_rating"] = trip.rating / object["frequency"]

		# 	@data << object

		# 	@data.each do |object|
		# 		object.keys.include?(object["name"])
		# 			object["frequency"] += 1


			# end


		# method 2
		# data = []
		# total_rating = 0
		# frequency = 0
		# avg_rating = total_rating / frequency

		# all_trips_within_30.each do |trip|
		# 	if data.include?(trip.location.name)

		# method 3
		# @locations.each do |x, y|
		# 	if x["name"] == y["name"]
		# 		x["frequency"] += 1
		# 		x["total"] += y["rating"]
		# 		x["avg"] = x["total"] / x["frequency"]
		# 		@locations.delete(y)
		# 	end
		# end
		# @locations = []
		# all_trips_within_30.each do |trip|
		# 	@locations << {name: trip.location.name, rating: trip.rating, total: trip.rating, frequency: 1}
		# end

		# @locations.each_with_index do |object, index|

		# 	if @locations.any? { |h| h[:name] == object[:name] }

		# 		@locations[object[:index]][:frequency] += 1
		# 		@locations[object[:index]][:total] += object[:rating]
		# 	else 
		# 		@data << {name: object[:name], rating: object[:rating], total: object[:total], frequency: object[:frequency]}
		# 	end
		# end



	# 	@locations = []
	# 	array.each do |element|
	# 		helper(@locations, element)
	# 	end
	# def helper(array, hash)
	# 	array.each do |element|
	# 		if element[:name] == hash[:name]
	# 			element[:frequency] += 1
	# 			element[:total] += hash[:rating]
	# 			element[:avg] = element[:total] / element[:frequency]
	# 		else
	# 			array << hash
	# 		end
	# 		array
	# 	end
	# end

end