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
	end

	def create
		trip = Trip.create(params[:trip])

		current_user.Location.find(params[:location_id]).trips << trip

		redirect_to trips_path
	end


end