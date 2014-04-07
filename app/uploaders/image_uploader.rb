# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Set image storage to fog
  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Process files as they are uploaded:
  process :resize_to_fit => [680, 680]

  # Create different versions of your uploaded files:
  version :thumb do
    process :resize_to_fill => [150, 150]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
