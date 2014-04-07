class LocationsController < ApplicationController
	before_filter :authenticate_user!

	# Action used render the locations index view.
	def index
		# Set a variable for all approved locations that a user can add.
		@approved_locations = Location.where(verified: true) - current_user.locations

		# Set a variable for all locations that are still pending admin approval
		@pending_locations = Location.where(verified: false)
	
		# Current user locations sorted alphabetically
		user = User.find(current_user)
		@my_locations = user.locations.sort! { |a,b| a.name <=> b.name }
	end

	# Action used to create a new location instance.
	def new
		@location = Location.new 
	end

	# Action used to save the newly created location instance.
	def create
		Location.create(params[:location])
		redirect_to locations_path
	end


	# Action used to add a location to the user's account.
	def add_to_my_location
		add_to_my_location = Location.find(params[:id])

		# Validation prevents a user from adding a duplicate of the same location.
		if current_user.locations.include?(add_to_my_location) == false
			current_user.locations << add_to_my_location
		end

		redirect_to locations_path
	end

	# Action used to remove a location from the user's account.
	def remove_from_my_location
		remove_from_my_location = Location.find(params[:id])

		# Validation prevents a user from deleting a location unless it is linked to their account.
		if current_user.locations.include?(remove_from_my_location)
			current_user.locations.delete(remove_from_my_location)
		end

		redirect_to locations_path
	end

end