require 'csv'
require_relative "patient"
class PatientRepository
  def initialize(csv_file_path, room_repository)
    @csv_file_path = csv_file_path
    @room_repository = room_repository
    @next_id = 1
    @patients = []
    load_csv
  end

  def create(patient)
    patient.id = @next_id
    @next_id += 1
    @patients << patient
  end
  
  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      row[:age] = row[:age].to_i
      row[:cured] = row[:cured] == "true"
      room_id = row[:room_id].to_i
      room = @room_repository.find(room_id)
      patient = Patient.new(row)
      patient.room = room
      @patients << patient
    end
    @next_id = @patients.last.id + 1 unless @patients.empty?
  end
end