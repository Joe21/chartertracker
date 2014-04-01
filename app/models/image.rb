class Image < ActiveRecord::Base
  attr_accessible :data

  belongs_to :users
 	mount_uploader :data, ImageUploader
end
