class Router
  def initialize(controller)
    @controller = controller
  end
  
  # BEHAVIOR
  # - Display a 'menu' to the user
  def run
    loop do
      display_menu
      action = get_action
      dispatch_action(action)
    end
  end
  
  # - Get input from the user
  # - Dispatch the action

  def display_menu
    puts "Welcome!"
    puts "1 - List all tasks"
    puts "2 - Add a new task"
    puts "3 - Mark a task as done"
  end
  
  def dispatch_action(action)
    case action
    when 1 then @controller.list
    when 2 then @controller.add_task
    when 3 then @controller.mark_as_done
    else
      puts "Wrong input"
    end
  end

  def get_action
    puts "What do you want to do?"
    gets.chomp.to_i
  end
end