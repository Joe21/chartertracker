class AdminsController < ApplicationController
	before_filter :authenticate_user!
	before_filter :is_admin?

	# Function to be used with the before_filter. Will confirm admin or render trespass view
	def is_admin?
		if current_user.admin?
			true
		else
			render :trespass
		end
	end

	# Controller Actions
	def index
		@pending_locations = Location.where(verified: false)
		@all_users = User.all
		@all_users.sort! { |a, b| a.name <=> b.name }
	end

	# Action used by admins to approve newly submitted location
	def approve
		location = Location.find(params[:id])
		location.update_attribute(:verified, true)
		location.save!

		redirect_to admins_path
	end

	# Action used by admins to reject a newly submitted location
	def reject
		location = Location.find(params[:id])
		location.destroy

		redirect_to admins_path
	end

	# Action used by admins to access a user's images
	def images
		@user = User.find(params[:id])
	end

	# Action used by admins to delete a user's images
	def delete_image
		image = Image.find(params[:id])
		image.destroy

		redirect_to admins_path
	end
end