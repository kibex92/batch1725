class Room
  attr_reader :patients, :id

  class CapacityReachedError < StandardError; end
  # STATE
  # - capacity
  # - name
  # - wing
  # - patients
  # - station
  def initialize(attributes = {})
    @name = attributes[:name]
    @capacity = attributes[:capacity] || 0
    @patients = attributes[:patients] || [] # => Patient instances
    @id = attributes[:id]
  end

  # BEHAVIOR
  # - Add patients
  # - Discharge patients
  # - Full?

  def add_patient(patient)
    if full?
      raise CapacityReachedError, "Room capacity reached"
    else
      @patients << patient
      patient.room = self
    end
  end

  def full?
    @patients.length >= @capacity
  end
end