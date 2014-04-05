class ImagesController < ApplicationController
	before_filter :authenticate_user!

	def index
		@images = current_user.images
	end

	def show
		@image = Image.find(params[:id])
	end

	def new
		@image = Image.new
	end

	def create
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

	def destroy
		image = Image.find(params[:id])
		image.destroy
		redirect_to :back
	end
end

# <%= image_tag image.data_url(:thumb).to_s %><br />