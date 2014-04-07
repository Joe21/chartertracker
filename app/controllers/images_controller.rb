class ImagesController < ApplicationController
	before_filter :authenticate_user!

	# Action used to render the current user's gallery in thumbnail size.
	def index
		@images = current_user.images
	end

	# Action used to render an individual image in "full size".
	def show
		@image = Image.find(params[:id])
	end

	# Action used to create a new instance of image
	def new
		@image = Image.new
	end

	# Action used to save the newly created image.
	def create

		# Validation: Checks if user forgot to choose an image file. Also prevents user from exceeding an image count of 10.
		response = params[:image]
		if (response == nil || current_user.images.count == 10)
			render :error
		else
			image = Image.create(params[:image])
			image.update_attribute :user_id, current_user.id
			image.save!
			redirect_to images_path
		end
	end

	# Action used to destroy the image. Image is deleted from both the database and the fog.
	def destroy
		image = Image.find(params[:id])
		image.destroy
		redirect_to :back
	end
end