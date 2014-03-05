User.delete_all
Location.delete_all
Trip.delete_all

User.create(email:"joe@joe.com", password:"password", name:"Joe")
User.create(email:"john@john.com", password:"password", name:"John")
User.create(email:"lonebull@lonebull.com", password:"password", name:"Lonebull")
Location.create(name:"World's Fair Marina", verified: true)
Location.create(name:"Freeport", verified: true)
Location.create(name:"Captree", verified: true)
Trip.create(date:"12/10/13", vessel:"Laura Lee", rating:"8", comments:"Pretty good trip. Hit a lot of seabass")
Trip.create(date:"1/1/14", rating:"9", comments:"Killed it")
Trip.create(date:"2/1/14", vessel:"NevrEnuff2", rating:"8", comments:"Really cold but slammed the bluefish...a couple stripers too")
Trip.create(date:"2/2/14", vessel:"NevrEnuff2", rating:"3", comments:"Weather sucked, the whole boat skunked, and one of the engines blew out so it took 3 hours to get back to port")

# User.all.each do
# 	|user| user.locations << Location.all
# end

# @joe = User.find(1)
# @john = User.find(2)
# @lonebull = User.find(3)

# @location1 = Location.find(1)
# @location2 = Location.find(2)
# @location3 = Location.find(3)

# @trip1 = Trip.find(1)
# @trip2 = Trip.find(2)
# @trip3 = Trip.find(3)
# @trip4 = Trip.find(4)

# @joe.locations << Location.all
# @john.locations << Location.all
# @lonebull.locations << Location.all

# @location1.trips << @trip3
# @location1.trips << @trip4
# @location2.trips << @trip2
# @location3.trips << @trip1


# User.all.each do |user| user.locations << Location.all end

# User.first.locations << Location.first
# User.first.locations << Location.last

# Location.first.trips << Trip.first
# Location.first.trips << Trip.last

## all_users = User.all
# each_location = Location.all.each do |location| location end
# all_users.each do
# 	|user| user.locations << each_location	
# end

## Testing History
# @joe = User.find_by_id(1)
# @john = User.find_by_id(2)

# @joe.locations << Location.all
# @john.locations << Location.all

# @trip1 = Trip.find_by_date("12/10/13")
# @trip2 = Trip.find_by_date("1/1/14")
# @trip3 = Trip.find_by_date("2/1/14")
# @trip4 = Trip.find_by_date("2/2/14")

# @location1 = Location.find_by_name("World's Fair Marina")
# @location2 = Location.find_by_name("Freeport")
# @location3 = Location.find_by_name("Captree")

# @location1.trips << @trip3
# @location1.trips << @trip4
# @location2.trips << @trip2
# @location3.trips << @trip1

# @joe.trips << @trip1
# @joe.trips << @trip3
# @john.trips << @trip1
# @john.trips << @trip2
# @john.trips << @trip4