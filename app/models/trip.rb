class Trip < ActiveRecord::Base
	attr_accessible :name, :date, :vessel, :captain, :rating, :comments

	belongs_to :location
	belongs_to :users
end
