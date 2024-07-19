class Controller
  def initialize(view, task_repository)
    @view = view
    @task_repository = task_repository
  end
  





  def add_task
    description = @view.ask_user_for_description # => String
    task = Task.new(description)
    @task_repository.create(task)
  end

  def list
    # 1. Get all the tasks -> Task Repository
    tasks = @task_repository.all # -> Array of Task objects
    # 2. Pass the tasks to the view to be displayed -> View
    @view.display(tasks)
  end

  def mark_as_done
    # 1. Display the list
    list
    # 2. Ask the user which task to mark as done
    index = @view.ask_user_for_index
    # 3. Find the task in the task repository
    task = @task_repository.find(index)
    # 4. Mark it
    task.done!
    # 5. Display
    list
  end
end
