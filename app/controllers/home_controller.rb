class HomeController < ApplicationController
	before_filter :authenticate_user!, only: [:home] 

	def home
	end

end