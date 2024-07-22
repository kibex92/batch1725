class Router
  def initialize(meals_controller, customers_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @running = true
  end

  def run
    # 1. Display menu
    while @running
      display_menu
      # 2. Get user input
      action = gets.chomp.to_i
      # 3. Dispatch action
      dispatch_action(action)
    end
  end
  
  def display_menu
    puts "Welcome to Lieferando!"
    puts "1 - Add a new meal"
    puts "2 - List all meals"
    puts "3 - Add a new customer"
    puts "4 - List all customers"
    puts "9 - Exit"
  end
  
  def dispatch_action(action)
    case action
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @customers_controller.add
    when 4 then @customers_controller.list
    when 9 then stop
      
    else
      puts "Wrong input!"
    end
  end

  def stop
    @running = false
    puts "Goodbye"
  end
end