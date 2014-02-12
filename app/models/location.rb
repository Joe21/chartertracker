class Location < ActiveRecord::Base
  attr_accessible :name

  belongs_to :users
  has_many :trips
end

