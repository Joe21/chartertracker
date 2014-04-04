class TripsController < ApplicationController
	before_filter :authenticate_user!

	def index
		user = User.find(current_user)
		@my_locations = user.locations.sort! { |a,b| a.name <=> b.name }
	end

	def new
		@trip = Trip.new(name: Time.now.strftime("%m/%d/%Y"), date: Time.now.strftime("%d/%m/%Y"))

		# Set location_id hash w/ the key of 1 value the location id passed from params
		@location_id = Hash.new
		@location_id[1]= params[:id]
	end

	def create

		# Saves the new instance of trip into the DB.
		trip = Trip.create(params[:trip])

		# Saves trip to the user's trips.
		current_user.trips << trip

		# Saves trip to the locations's trips.
		location = Location.find(params[:location_id])
		location.trips << trip

		current_user.increment(:trips_counter)
		current_user.save

		redirect_to trips_path
	end

	def edit
		@trip = Trip.find(params[:id])
	end

	def update
		trip = Trip.find(params[:id])
		trip.update_attributes(params[:trip])

		redirect_to trips_path
	end

	def destroy
		trip = Trip.find(params[:id])
		trip.destroy
		
		current_user.decrement(:trips_counter)
		current_user.save

		redirect_to trips_path
	end

end