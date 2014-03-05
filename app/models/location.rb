class Location < ActiveRecord::Base
  attr_accessible :name, :verified

  belongs_to :users
  has_many :trips
end