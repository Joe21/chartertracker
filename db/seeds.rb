User.delete_all
Location.delete_all
Trip.delete_all
Image.delete_all

Location.create(name:"World's Fair Marina", verified: true)
Location.create(name:"Freeport", verified: true)
Location.create(name:"Captree", verified: true)
Location.create(name: "Montauk Marine Basin", verified: true)
Location.create(name: "Point Lookout", verified: true)
Location.create(name: "Sheepshead Bay", verified: true)
Location.create(name: "Howard Beach", verified: true)
Location.create(name: "Jamaica Bay", verified: true)
