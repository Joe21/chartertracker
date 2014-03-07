class TripsController < ApplicationController
	before_filter :authenticate_user!, only: [:index]

	def index
	end

	def index_by_location
	end

	def show
	end



end