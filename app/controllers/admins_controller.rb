class AdminsController < ApplicationController
	before_filter :authenticate_user!
	before_filter :is_admin?

	def is_admin?
		if current_user.admin?
			true
		else
			render :trespass
		end
	end

	def index
		@pending_locations = Location.where(verified: false)
		@all_users = User.all
		@all_users.sort! { |a, b| a.name <=> b.name }
	end

	def approve
		location = Location.find(params[:id])
		location.update_attribute(:verified, true)
		location.save!

		redirect_to admins_path
	end

	def reject
		location = Location.find(params[:id])
		location.destroy

		redirect_to admins_path
	end

	def images
		@user = User.find(params[:id])
	end

	def delete_image
		image = Image.find(params[:id])
		image.destroy

		redirect_to admins_path
	end
end