class Patient
  attr_reader :name, :age
  attr_accessor :room, :id
  # STATE
  # - name
  # - age
  # - gender
  # - illness
  # - HP left
  # - Insurance level
  # - blood group
  # - ssn
  # - cured

  def initialize(attributes = {})
    @name = attributes[:name]
    @age = attributes[:age]
    @cured = attributes[:cured] || false
    @room = attributes[:room]
    @id = attributes[:id]
  end

  # BEHAVIOR
  # - cured?
  # - cure!
  # - update illness
  # - release!
  # - history of visits

  def cured?
    @cured
  end
  
  def cure!
    @cured = true
  end
end