class Trip < ActiveRecord::Base
	attr_accessible :date, :vessel, :captain, :rating, :comments

	belongs_to :location
	belongs_to :users
end
