class CustomersView
  def ask_user_for(stuff)
    puts "What's the #{stuff}"
    gets.chomp
  end
  
  def display(customers)
    customers.each_with_index do |customer, index|
      puts "#{index + 1}. #{customer.name} - #{customer.address}"
    end
  end
end