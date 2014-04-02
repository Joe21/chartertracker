class ImagesController < ApplicationController
	before_filter :authenticate_user!

	def index
		@images = current_user.images
	end

	def show
	end

	def new
		@image = Image.new
	end

	def create
		response = params[:image]
		if response == nil
			redirect_to new_image_path
		else
			if current_user.images.count < 5
				image = Image.create(params[:image])
				image.update_attribute :user_id, current_user.id
				image.save!
				redirect_to images_path
			else
				render :limit
			end
		end
	end

	def destroy
		image = Image.find(params[:id])
		image.destroy
		redirect_to images_path
	end

end