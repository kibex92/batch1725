class OrdersView
  def ask_user_for_index
    puts "What's the number?"
    gets.chomp.to_i - 1
  end

  def display(riders)
    riders.each_with_index do |rider, index|
      puts "#{index + 1}. #{rider.username}"
    end
  end
end