class TaskRepository
  # STATE
  # - tasks
  def initialize
    @tasks = []
  end
  

  # BEHAVIOR
  # Create a new task in the tasks array
  def create(task)
    @tasks << task
  end
  
  # Get all the tasks
  def all
    @tasks
  end
  
  # Remove a task
  def destroy(index)
    @tasks.delete_at(index)
  end

  def find(index)
    @tasks[index]
  end  
end
