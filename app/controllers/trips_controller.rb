class TripsController < ApplicationController
	before_filter :authenticate_user!, only: [:index]

	def index
		@all_my_trips = current_user.trips
	end

	def index_by_location
	end

	def show
	end

	def new
		@trip = Trip.new(date:Time.now.strftime("%m/%d/%Y"))
		@location_id = Hash.new

		# Set location_id hash w/ the key of 1 value the location id passed from params
		@location_id[1]= params[:id]

	end

	def create

		# Saves the new instance of trip into the DB.
		trip = Trip.create(params[:trip])

		# Saves trip to the location (This function does not save to the user's trip, but rather the location.)
		current_user.locations.find(params[:location_id]).trips << trip

		# Saves trip to the user's trips.
		current_user.trips << trip

		redirect_to trips_path
	end


end