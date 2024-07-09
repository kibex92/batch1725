require 'date'

# puts "Hello Giordana"
# puts "Hello Kenan"


# def greeting(first_name, last_name)
#   return "Good morning #{first_name.capitalize} #{last_name.capitalize}!"
# end

# text = greeting("Boris")
# puts text
# puts "Text is: #{text}"
# puts "What's your name?"
# name = gets.chomp
# puts greeting(name)

def tomorrow
  date_tomorrow = Date.today + 1
  return date_tomorrow.strftime("%B %d")
end

puts tomorrow