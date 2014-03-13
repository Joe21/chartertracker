require 'spec_helper'

describe User do

	before :each do
		@joe = User.create(email:"joe@joe.com", password:"password", name:"Joe")
		@john = User.create(email:"john@john.com", password:"password", name:"John")
		@marina = Location.create(name:"World's Fair Marina", verified: true)
		@freeport = Location.create(name:"Freeport", verified: true)
		@trip1 = Trip.create(date:"12/10/13", vessel:"neverenuff", rating:"8", comments:"Pretty good trip.")
		@trip2 = Trip.create(date:"1/1/14", rating:"9", comments:"Killed it")

		@joe.locations << @marina
		@joe.locations << @freeport
		@john.locations << @marina
		@john.locations << @freeport

		@joe.trips << @trip1
		@john.trips << @trip1
		@john.trips << @trip2

	end

	# Testing basic model attributes
	describe "#email" do
		it "should return the correct user's email" do
			@joe.email.should eq("joe@joe.com")
			@john.email.should eq("john@john.com")
		end
	end

	describe "#name" do
		it "should return the correct user's name" do
			@joe.name.should eq("Joe")
			@john.name.should eq("John")
		end
	end

	# Testing basic object relations
	describe "#locations" do
		it "should return an array of user's locations" do
			@joe.locations.should eq([@marina, @freeport])
			@joe.locations.should eq([@marina, @freeport])
		end
	end

	describe "#trips" do
		it "should return an array of the user's trips" do
			@joe.trips.should eq([@trip1])
			@john.trips.should eq([@trip1, @trip2])
		end
	end

	describe "#trips_by_location" do
		it "should return an array of the user's trips by their first location" do
			@joe.locations.first.trips eq([@trip1])
			@john.locations.first.trips eq([@trip1, @trip2])
		end
	end
end