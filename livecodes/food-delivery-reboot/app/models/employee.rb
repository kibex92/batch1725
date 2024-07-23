class Employee
  attr_reader :id, :username, :password

  # STATE
  # - username
  # - password
  # - role
  # - payrole
  # - insurance number
  # - address
  def initialize(attributes = {})
    @id = attributes[:id]
    @username = attributes[:username]
    @password = attributes[:password]
    @role = attributes[:role]
  end

  def manager?
    @role == "manager"
  end

    
  def rider?
    @role == "rider"
  end
end