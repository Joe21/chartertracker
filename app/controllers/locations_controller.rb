class LocationsController < ApplicationController
	before_filter :authenticate_user!, only: [:index, :new, :create]

	def index
	end

	def new
		@location = Location.new
	end

	def create
		new_user_location = Location.create(params[:location])
		# redirect_to user_locations_path(current_user.id)
	end



end