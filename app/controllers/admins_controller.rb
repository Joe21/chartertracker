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
		@test = is_admin?
	end

end