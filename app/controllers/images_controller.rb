class ImagesController < ApplicationController
	before_filter :authenticate_user!

	mount_uploader :data, ImageUploader

	def index
		@image = params[:file]
	end

end