require 'date'

def days_until_christmas(date = Date.today)
  christmas_date = Date.new(date.year, 12, 25)
  if date > christmas_date
    # christmas_date = Date.new(date.year + 1, 12, 25)
    christmas_date = christmas_date.next_year
  end
  days_left = christmas_date - date

  return days_left.to_i
end

# 1. Define the christmas date
# 2. Check if date is greater than xmas
#   if yes -> Increment the year of xmas by 1
# 3. Subtract xmas with date

puts days_until_christmas
puts days_until_christmas(Date.new(2024, 12, 25)).class == Integer
puts days_until_christmas(Date.new(2024, 12, 25)) == 0
puts days_until_christmas(Date.new(2024, 12, 24)) == 1
puts days_until_christmas(Date.new(2025, 12, 26)) == 364
