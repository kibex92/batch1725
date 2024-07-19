class Task
  attr_reader :description
  
  # STATE
  # - description
  # - done
  # - category
  # - due_date
  # - prio ity

  # BEHAVIOR
  # - done!
  # - done?

  def initialize(description)
    @description = description
    @done = false
  end
  
  def done?
    @done
  end
  
  def done!
    @done = true
  end
end
