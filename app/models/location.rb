class Location < ActiveRecord::Base
  attr_accessible :name, :verified, :users

  has_and_belongs_to_many :users
  has_many :trips
end