class Router
  def initialize(meals_controller, customers_controller, sessions_controller, orders_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @orders_controller = orders_controller
    @running = true
  end

  def run
    # 1. Display menu
    while @running
      # SIGN IN -> 
      @employee = @sessions_controller.sign_in
      while @employee
        # Display the menu based on the role of the employee
        display_menu
        # 2. Get user input
        action = gets.chomp.to_i
        # 3. Dispatch action based on employee
        dispatch(action)
      end
    end
  end
  
  def display_menu
    if @employee.manager?
      display_manager_menu
    else
      display_rider_menu
    end
  end
  
  def display_manager_menu
    puts "Welcome to Lieferando!"
    puts "1 - Add a new meal"
    puts "2 - List all meals"
    puts "3 - Add a new customer"
    puts "4 - List all customers"
    puts "5 - Add a new order"
    puts "8 - Log out"
    puts "9 - Exit"
  end

  def display_rider_menu
    puts "Welcome to Lieferando!"
    puts "1 - List my undelivered orders"
    puts "9 - Exit"
  end

  def dispatch(action)
    if @employee.manager?
      dispatch_manager_action(action)
    else
      dispatch_rider_action(action)
    end
  end

  def dispatch_manager_action(action)
    case action
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @customers_controller.add
    when 4 then @customers_controller.list
    when 5 then @orders_controller.add
    when 8 then logout
    when 9 then stop
    else
      puts "Wrong input!"
    end
  end

  def logout
    @employee = nil
  end

  def dispatch_rider_action(action)
    case action
    when 1 then puts "TODO"
    when 9 then stop
    else
      puts "Wrong input!"
    end
  end

  def stop
    logout
    @running = false
    puts "Goodbye"
  end
end