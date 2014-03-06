class LocationsController < ApplicationController
	before_filter :authenticate_user!, only: [:index, :new, :create, :edit, :update]

	def index
	end

	def new
		@location = Location.new
	end

	def create
		location = Location.create(params[:location])
		redirect_to locations_path
	end

	def edit
		@location = Location.find(params[:id])
	end

	def update 
		location = Location.find(params[:id])
		location.update_attributes(params[:location])

		redirect_to locations_path
	end

	def remove
		remove_this_location = Location.find(params[:id])
		if current_user.locations.include?(remove_this_location)
			current_user.locations.delete(remove_this_location)
		end

		redirect_to locations_path
	end
	
end