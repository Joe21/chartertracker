class TripsController < ApplicationController
	before_filter :authenticate_user!

	# Action used to render the trips index view.
	def index
		user = User.find(current_user)

		# Sort the users locations alphabetically
		@my_locations = user.locations.sort! { |a,b| a.name <=> b.name }
	end

	# Action used to create a new trip instance.
	def new
		# New instance is created the formatted date as both the name and date attributes.
		@trip = Trip.new(name: Time.now.strftime("%m/%d/%Y"), date: Time.now.strftime("%d/%m/%Y"))

		# Set location_id hash (key = 1, value = location id passed from params)
		@location_id = Hash.new
		@location_id[1]= params[:id]
	end

	# Action used to save the newly created instance.
	def create

		# Saves the new instance of trip into the DB.
		trip = Trip.create(params[:trip])

		# Saves trip to the user's trips.
		current_user.trips << trip

		# Saves trip to the locations's trips.
		location = Location.find(params[:location_id])
		location.trips << trip

		# Increments the user's trips_counter.
		current_user.increment(:trips_counter)
		current_user.save

		redirect_to trips_path
	end

	# Action used to find the selected trip for editting.
	def edit
		@trip = Trip.find(params[:id])
	end

	# Action used to save changes to the trip.
	def update
		trip = Trip.find(params[:id])
		trip.update_attributes(params[:trip])

		redirect_to trips_path
	end

	# Action used to delete the trip.
	def destroy
		trip = Trip.find(params[:id])
		trip.destroy
		
		# Decrements the user's trip_counter.
		current_user.decrement(:trips_counter)
		current_user.save

		redirect_to trips_path
	end

end