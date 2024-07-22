require_relative "patient_repository"
require_relative "room_repository"
require_relative "room"
require_relative "patient"


room_repository = RoomRepository.new("rooms.csv")
patient_repository = PatientRepository.new("patients.csv", room_repository)

michele = Patient.new(age: 30, name: "Michele", cured: false)
boris = Patient.new(age: 30, name: "Boris", cured: false)

patient_repository.create(michele)
patient_repository.create(boris)
p patient_repository