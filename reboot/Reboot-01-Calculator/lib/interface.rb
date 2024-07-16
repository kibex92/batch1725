require_relative "calculate"
answer = "Y"
puts "Welcome to our nice calculator!"
while answer == "Y"
  puts "What is the first number?"
  first_number = gets.chomp.to_i
  puts "Enter the second number"
  second_number = gets.chomp.to_i
  puts "What's the operator? [+][-][*][/]"
  operator = gets.chomp
  result = calculate(first_number, second_number, operator)

  if result.nil?
    puts "Oops, wrong operator. Please try again!"
  end

  puts "The result is #{result}"
  puts "Would you like to perform another calculation, sir? (Y/N)"
  answer = gets.chomp.upcase
end

puts "Goodbye!"