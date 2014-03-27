require 'spec_helper'

describe Trip do

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
		it "should return the correct trip name" do
			@trip1.name.should eq("12/10/13")
			@trip2.name.should eq("bla")
			@trip3.name.should eq("birthday")
		end
	end

	describe "#date" do
		it "should return the correct trip date" do
			@trip1.date.should eq(Time.new(2013, 12, 10))
			@trip2.date.should eq(Time.new(2014, 1, 1))
			@trip3.date.should eq(Time.new(2014, 1, 2))
		end
	end

	describe "#vessel" do
		it "should return the correct trip vessel" do
			@trip1.vessel.should eq("neverenuff")
			@trip2.vessel.should eq("N/A")
			@trip3.vessel.should eq("N/A")
		end
	end

	describe "#captain" do
		it "should return the correct trip captain" do
			@trip1.captain.should eq("Jim")
			@trip2.captain.should eq("N/A")
			@trip3.captain.should eq("N/A")
		end
	end

	describe "#rating" do
		it "should return the correct trip rating" do
			@trip1.rating.should eq(4)
			@trip2.rating.should eq(5)
			@trip3.rating.should eq(1)
		end
	end

	describe "#comments" do
		it "should return the correct trip comment" do
			@trip1.comments.should eq("Pretty good trip.")
			@trip2.comments.should eq("Killed it")
			@trip3.comments.should eq("Too cold")
		end
	end

	# Testing object relations
	describe "#location" do
		it "should return an array of users for that instance of trip" do
			@trip1.location.should eq(@marina)
			@trip2.location.should eq(@marina)
			@trip3.location.should eq(@freeport)
		end
	end
end