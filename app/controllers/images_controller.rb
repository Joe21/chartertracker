class ImagesController < ApplicationController
	before_filter :authenticate_user!

	def index
		@image = Image.create(params[:image])
		current_user.image = @image

		puts '====================='
		puts @image.data.to_s
		puts '====================='
	end

	def show
		@image = Image.find_by_user_id(current_user.id)
	end

end