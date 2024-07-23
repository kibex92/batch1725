class SessionsView
  def ask_user_for(stuff)
    puts "What's the #{stuff}"
    gets.chomp
  end

  def successfull_login(username)
    puts "Welcome #{username}"
    puts "\n"
  end
  
  def wrong_credentials
    puts "Wrong input, try again!"
  end
end
