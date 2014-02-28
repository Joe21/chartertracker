class LocationsController < ApplicationController
	before_filter :authenticate_user!, only: [:index]

	def index
	end

	def new
		@new_user_location = Location.new
	end

	def create
		new_user_location = Location.create(params[:location])
	end



end