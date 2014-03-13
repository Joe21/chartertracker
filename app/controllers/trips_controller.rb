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
		@location_id = params[:id].to_i

		puts "----------------------------"
		puts @location_id
		puts @location_id.to_s
		puts @location_id.class
		puts "----------------------------"
		puts "----------------------------"

	end

	def create

		puts "----------------------------"
		puts params[:location_id]
		puts params[:location_id].class
		puts params[:location_id].to_s
		puts params[:location_id].to_i	
		puts "----------------------------"
		puts "----------------------------"

		# Saves the new instance of trip into the DB.
		trip = Trip.create(params[:trip])

		# Saves trip to the location (This function does not save to the user's trip, but rather the location.)
		current_user.locations.find(params[:location]).trips << trip

		# Saves trip to the user's trips.
		current_user.trips << trip

		redirect_to trips_path
	end


end