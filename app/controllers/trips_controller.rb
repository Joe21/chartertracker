class TripsController < ApplicationController
	before_filter :authenticate_user!, only: [:index]

	def index
	end

	def new
		@trip = Trip.new(date:Time.now.strftime("%m/%d/%Y"))

		# Set location_id hash w/ the key of 1 value the location id passed from params
		@location_id = Hash.new
		@location_id[1]= params[:id]
	end

	def create

		# Saves the new instance of trip into the DB.
		trip = Trip.create(params[:trip])

		# Saves trip to the user's trips.
		current_user.trips << trip

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
		location_name = trip.location.name
		location_id = trip.location.id

		puts "-----------------------"
		puts "Response"
		puts params[:id]
		puts location_name
		puts location_id
		puts "-----------------------"
		puts "-----------------------"



		# trip.destroy
		redirect_to trips_path
	end

end