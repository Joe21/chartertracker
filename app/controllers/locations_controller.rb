class LocationsController < ApplicationController
	before_filter :authenticate_user!

	def index
		# Set a variable for all approved locations that a user can add.
		@approved_locations = Location.where(verified: true) - current_user.locations

		@pending_locations = Location.where(verified: false)
	
		# Current user locations sorted alphabetically
		user = User.find(current_user)
		@my_locations = user.locations.sort! { |a,b| a.name <=> b.name }
	end

	def new
		@location = Location.new 
	end

	def create
		Location.create(params[:location])
		redirect_to locations_path
	end

	def add_to_my_location
		add_to_my_location = Location.find(params[:id])
		if current_user.locations.include?(add_to_my_location) == false
			current_user.locations << add_to_my_location
		end

		redirect_to locations_path
	end

	def remove_from_my_location
		# @user = User.find(current_user.id)

		remove_from_my_location = Location.find(params[:id])
		if current_user.locations.include?(remove_from_my_location)
			current_user.locations.delete(remove_from_my_location)
		end

		redirect_to locations_path
	end

end