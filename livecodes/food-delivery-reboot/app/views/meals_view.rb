class MealsView
  def ask_user_for(stuff)
    puts "What's the #{stuff}"
    gets.chomp
  end
  
  def ask_user_for_price
    ask_user_for("price").to_i
  end
end