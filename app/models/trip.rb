class Trip < ActiveRecord::Base
	attr_accessible :date, :vessel, :captain, :rating, :comments

	belongs_to :locations
	belongs_to :users
end
