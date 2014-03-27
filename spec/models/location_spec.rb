require 'spec_helper'

describe Location do

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
	describe "#name" do
		it "should return the correct location's name" do
			@marina.name.should eq("World's Fair Marina")
			@freeport.name.should eq("Freeport")
			@captree.name.should eq("Captree")
		end
	end

	describe "#verified" do
		it "should return the correct boolean value" do
			@marina.verified.should eq(true)
			@freeport.verified.should eq(true)
			@captree.verified.should eq(false)
		end
	end

	# Testing object relations
	describe "#trips" do
		it "should return an array of trips for the location" do
			@marina.trips.should eq([@trip1, @trip2])
			@freeport.trips.should eq([@trip3])
			@captree.trips.should eq([])
		end
	end

	describe "#users_by_location" do
		it "should return an array of user's per location" do
			@marina.users.should eq([@joe, @john])
			@freeport.users.should eq([@joe, @john])
			@captree.users.should eq([])
		end
	end
end