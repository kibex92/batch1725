balance = 100

puts "Welcome to the horse race! 🏇"
horses = ["Kenan", "Daniel", "Arman"]
while balance >= 10
  horses.each_with_index do |horse, index|
    puts "#{index + 1}. #{horse}"
  end
  puts "Which horse would you like to bet on, sir? (please input the number)"
  user_choice_index = gets.chomp.to_i - 1
  winning_horse = horses.sample
  user_horse = horses[user_choice_index]

  if winning_horse == user_horse
    puts "Congrats, you win! #{winning_horse} is the winning horse"
    balance += 50
    puts  "Current balance is #{balance}"
  else
    puts "Sorry, you lost! #{winning_horse} won the race :("

    balance -= 10
    puts  "Current balance is #{balance}"

  end
end

puts "Enough, go home!"


