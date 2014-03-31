class Image < ActiveRecord::Base
	require 'carrierwave/orm/activerecord'

  attr_accessible :data

  belongs_to :user
end
