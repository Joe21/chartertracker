User.delete_all
Location.delete_all
Trip.delete_all

User.create(email:"joe@joe.com", password:"password", name:"Joe")
User.create(email:"john@john.com", password:"password", name:"John")
User.create(email:"lonebull@lonebull.com", password:"password", name:"Lonebull")
Location.create(name:"World's Fair Marina", verified: true)
Location.create(name:"Freeport", verified: true)
Location.create(name:"Captree", verified: true)
# Trip.create(date:"12/10/13", vessel:"Laura Lee", rating:"8", comments:"Pretty good trip. Hit a lot of seabass")
# Trip.create(date:"1/1/14", rating:"9", comments:"Killed it")
# Trip.create(date:"2/1/14", vessel:"NevrEnuff2", rating:"8", comments:"Really cold but slammed the bluefish...a couple stripers too")
# Trip.create(date:"2/2/14", vessel:"NevrEnuff2", rating:"3", comments:"Weather sucked, the whole boat skunked, and one of the engines blew out so it took 3 hours to get back to port")

# Seed Testing
# User.all.each do |user| user.locations << Location.all end

# joe = User.find_by_name("Joe")
# john = User.find_by_name("John")
# lonebull = User.find_by_name("Lonebull")

# marina = Location.find_by_name("World's Fair Marina")
# freeport = Location.find_by_name("Freeport")
# captree = Location.find_by_name("Captree")

# never1 = Trip.find_by_date("2/1/14")
# never2 = Trip.find_by_date("2/2/14")
# laura = Trip.find_by_date("12/10/13")
# restless = Trip.find_by_date("1/1/14")