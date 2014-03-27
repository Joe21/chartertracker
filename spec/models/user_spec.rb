require 'spec_helper'

describe User do

	before :each do
		@joe = User.create(email:"joe@joe.com", password:"password", name:"Joe", trips_counter: 0)
		@john = User.create(email:"john@john.com", password:"password", name:"John", trips_counter: 10)

		@marina = Location.create(name:"World's Fair Marina", verified: true)
		@freeport = Location.create(name:"Freeport", verified: true)
		@captree = Location.create(name: "Captree", verified: false)

		@trip1 = Trip.create(name: "12/10/13", date: Time.new(2013, 12, 10), vessel:"neverenuff", captain: "Jim", rating: 4, comments:"Pretty good trip.")
		@marina.trips << @trip1

		@trip2 = Trip.create(name: "bla", date: Time.new(2014, 1, 1), vessel: "N/A", captain: "N/A", rating: 5, comments:"Killed it")
		@marina.trips << @trip2

		@trip3 = Trip.create(name: "birthday", date: Time.new(2014, 1, 2), vessel: "N/A", captain: "N/A", rating: 1, comments:"Too cold")
		@freeport.trips << @trip3


		@joe.locations << @marina
		@joe.locations << @freeport
		@john.locations << @marina
		@john.locations << @freeport

		@joe.trips << @trip1
		@joe.increment(:trips_counter)

		@john.trips << @trip1
		@john.increment(:trips_counter)

		@john.trips << @trip2
		@john.increment(:trips_counter)
		
		@john.trips << @trip3
		@john.increment(:trips_counter)
	end

	# Testing basic model attributes
	# Note that user admin attribute is NOT accessible within the app. This is strictly a function for the DBA, not a user.
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

	describe "#trips_counter" do
		it "should return the correct trips counter" do
			@joe.trips_counter.should eq(1)
			@john.trips_counter.should eq(13)
		end
	end

	# Testing object relations
	describe "#locations" do
		it "should return an array of user's locations" do
			@joe.locations.should eq([@marina, @freeport])
			@joe.locations.should eq([@marina, @freeport])
		end
	end

	describe "#location_by_user_trip" do
		it "should return the correct location of the user's trip" do
			@joe.trips[0].location.should eq(@marina)
			@john.trips.last.location.should eq(@freeport)
		end
	end

	describe "#trips" do
		it "should return an array of the user's trips" do
			@joe.trips.should eq([@trip1])
			@john.trips.should eq([@trip1, @trip2, @trip3])
		end
	end

	describe "#trips_by_user_location" do
		it "should return an array of the user's trips by their first location" do
			@joe.locations.first.trips eq([@trip1])
			@john.locations.first.trips eq([@trip1, @trip2, @trip3])
		end
	end
end