require_relative 'wishlist'
wishlist = [
  {
    name: "Bike",
    bought: false,
  }, 
  {
    name: "Book",
    bought: false
  }, 
  {
    name: "Macbook",
    bought: true
  }  
]

puts "Welcome to your wishlist app!"
loop do
  puts "Which action? [list|add|delete|mark|quit]"
  answer = gets.chomp.downcase 
  case answer
  when "list"
    if wishlist.empty?
      puts "Your wishlist is empty, try adding something to it!"
    else
      puts "Here are you wishes"
      display(wishlist)
    end

  when "add"
    puts "Which item would you like to add to your list,sir?"
    wish = gets.chomp
    wishlist << wish
    puts "#{wish} has been add to the list!"
    if wishlist.empty?
      puts "Your wishlist is empty, try adding something to it!"
    else
      puts "Here are you wishes"
      display(wishlist)
    end
  when "delete"
     if wishlist.empty?
      puts "Your wishlist is empty, try adding something to it!"
    else
      puts "Here are you wishes"
      
      display(wishlist)
    end
    puts "Which wish would you like to remove? (Enter the number)"
    index = gets.chomp.to_i - 1
    wish = wishlist.delete_at(index)
    puts "#{wish} has been succesfully removed!"
     if wishlist.empty?
      puts "Your wishlist is empty, try adding something to it!"
    else
      puts "Here are you wishes"
      display(wishlist)
    end
  when "mark"
  # 5. Display the wishlist
  display(wishlist)
  # 6. Ask the user which one to mark
  puts "Which wish would you like to mark as bought? (Enter the number)"
  # 7. Get user input
  index = gets.chomp.to_i - 1
  # 8. Find the wish in the wishlist
  
  # 9. Update the value of :bought to true
  # 10. Display
  when "quit"
    break
  else
    puts "Wrong input, try again!"
  end
end
puts "Thank you for using our service today! Goodbye."
