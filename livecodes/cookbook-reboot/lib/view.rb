# TODO: Define your View class here, to display elements to the user and ask them for their input
class View

  def ask_user_for(input)
    puts "What's the #{input}?"
    gets.chomp
  end
  
  def display_list(recipes)
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1}. #{recipe.name} #{recipe.description}"
    end
  end
  
  def ask_user_for_index
    ask_user_for("number").to_i - 1
  end
  
end