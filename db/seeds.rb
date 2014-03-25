User.delete_all
Location.delete_all
Trip.delete_all

User.create(email:"joe@joe.com", password:"password", name:"Joe")
User.create(email:"john@john.com", password:"password", name:"John")
User.create(email:"lonebull@lonebull.com", password:"password", name:"Lonebull")
Location.create(name:"World's Fair Marina", verified: true)
Location.create(name:"Freeport", verified: true)
Location.create(name:"Captree", verified: true)
Location.create(name: "Montauk Marine Basin", verified: true)
Location.create(name: "Point Lookout", verified: true)
Location.create(name: "Sheepshead Bay", verified: true)
Trip.create(name: "test1", date: DateTime.new(2014,03,10), vessel:"Laura Lee", captain: "", rating:"4", comments:"Pretty good trip. Hit a lot of seabass")
Trip.create(name: "test2", date: DateTime.new(2014,03,01), vessel: "Restless", captain: "Fred", rating:"5", comments:"Killed it")
Trip.create(name: "test3", date: DateTime.new(2014,03,14), vessel:"NevrEnuff2", captain: "Nick", rating:"1", comments:"Really cold but slammed the bluefish...a couple stripers too")
Trip.create(name: "test4", date: DateTime.new(2014,03,15), vessel:"NevrEnuff2", captain: "Romeo", rating:"3", comments:"Weather sucked, the whole boat skunked, and one of the engines blew out so it took 3 hours to get back to port")

# Seed Testing
User.first.locations << Location.all
User.first.trips << Trip.all
# User.all.each do |user| user.locations << Location.all end

# joe = User.find_by_name("Joe")
# john = User.find_by_name("John")
# lonebull = User.find_by_name("Lonebull")

# marina = Location.find_by_name("World's Fair Marina")
# freeport = Location.find_by_name("Freeport")
# captree = Location.find_by_name("Captree")

# test1 = Trip.find_by_name("test1")
# test2 = Trip.find_by_name("test2")
# test3 = Trip.find_by_name("test3")
# test4 = Trip.find_by_name("test4")

# captree.trips << test1
# freeport.trips << test2
# marina.trips << test3
# marina.trips << test4