class View
  # STATE

  # BEHAVIOR
  # Ask user for task description
  # Ask user for task number
  # Display all tasks

  def ask_user_for_description
    puts "What do you want to do?"
    gets.chomp
  end

  def display(tasks)
    tasks.each_with_index do |task, index|
      # task is an instance of the Task Class
      status = task.done? ? "[X]" : "[ ]"
      puts "#{index + 1}. #{status} #{task.description}"
    end
  end

  def ask_user_for_index
    puts "Which task? (Please enter the number?)"
    gets.chomp.to_i - 1
  end
end
