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
		if params[:image][:data].to_s.length < 1
			redirect_to new_image_path
		end

		if current_user.image_counter < 5
			image = Image.create(params[:image])
			image.update_attribute :user_id, current_user.id
			image.save!
			current_user.increment(:image_counter)
			current_user.save
		else
			render :limit
		end

		redirect_to images_path
	end

	def edit
	end

	def update
	end

	def destroy
		image = Image.find(params[:id])
		image.destroy
		current_user.decrement(:image_counter)
		current_user.save
		redirect_to images_path
	end




	# def index
	# 	@image = Image.create(params[:image])
	# 	current_user.image = @image

	# 	puts '====================='
	# 	puts @image.data.to_s
	# 	puts '====================='
	# end

	# def show
	# 	@image = Image.find_by_user_id(current_user.id)
	# end

end