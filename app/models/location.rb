class Location < ActiveRecord::Base
  attr_accessible :name, :verified

  has_and_belongs_to_many :users
  has_many :trips
end