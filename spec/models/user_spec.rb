require 'spec_helper'

describe User do

	before :each do
		@joe = User.create(email:"joe@joe.com", password:"password", name:"Joe")
		@john = User.create(email:"john@john.com", password:"password", name:"John")
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

	# Testing object relations


end