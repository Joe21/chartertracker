class Image < ActiveRecord::Base
  attr_accessible :data

  belongs_to :user
 	mount_uploader :data, ImageUploader
end
