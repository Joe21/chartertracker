class Image < ActiveRecord::Base
  attr_accessible :file

  belongs_to :user
end
