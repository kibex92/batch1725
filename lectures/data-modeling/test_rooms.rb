require_relative "room"
require_relative "patient"

ocean = Room.new(name: "Ocean", capacity: 2)

michele = Patient.new(age: 30, name: "Michele", cured: false)
arman = Patient.new(age: 22, name: "Arman", cured: true)
boris = Patient.new(age: 32, name: "Boris", cured: true)


# ERROR HANDLING
# begin
#   ocean.add_patient(michele)
#   ocean.add_patient(arman)
#   ocean.add_patient(boris)
# rescue Room::CapacityReachedError
#   puts "Sorry, the room is full"
# end

ocean.add_patient(michele)
ocean.add_patient(arman)

p arman.room.patients.last.room.patients.first.name