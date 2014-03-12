class TripsController < ApplicationController
	before_filter :authenticate_user!, only: [:index]

	def index
	end

	def index_by_location
	end

	def show
	end

	def new
		@trip = Trip.new(date:Time.now.strftime("%m/%d/%Y"))
	end

	def create
		location = Location.find(params[:id].to_i)
		trip = Trip.create(params[:trip])

		current_user.trips << trip
		location.trips << trip

		redirect_to trips_path
	end


end