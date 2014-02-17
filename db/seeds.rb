User.delete_all
Location.delete_all
Trip.delete_all

User.create(email:"joe@joe.com", password:"password", name:"Joe")
User.create(email:"john@john.com", password:"password", name:"John")
Location.create(name:"World's Fair Marina")
Location.create(name:"Freeport")
Location.create(name:"Captree")
Trip.create(date:"12/10/13", vessel:"Laura Lee", rating:"8", comments:"Pretty good trip. Hit a lot of seabass")