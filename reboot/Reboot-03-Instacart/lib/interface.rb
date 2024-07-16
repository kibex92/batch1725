# 1. Greet the user!
puts "Welcome to REWE"
# 2. Define the store -> Hash!
store = {
  "burek" => 12,
  "cevapi" => 15,
  "jogurt" => 2,
  "kaiserschmarn" => 20
}
# 3. Define cart -> Array
cart = []
# 4. Iterate over the store -> .each do |key, value|
store.each do |item, price|
  # 5. For every item display its name(key) and the price(value)
  puts "#{item} - #{price}€"
end
# START THE LOOP -> while/until user_answer 
loop do
  puts "Which item would you like to purchase, sir?"
  # 7. Get the user input
  item = gets.chomp
  if store.key?(item)
  # 8. Push the item into the array
    cart << item
    puts "#{item} has been adeded to the cart!"
  elsif item == "quit"
    break
  else
    puts "Sorry, we don't have #{item} today!"
  end
end
# 6. Ask the user which item to purchase

# 9. Iterate over the cart
sum = 0
cart.each do |item|
  price = store[item] 
  sum += price
end

puts "-------BILL---------
# > TOTAL: #{sum}€
# > --------------------"
# 10. For every item, check in store the price -> Hash reading hash[key]
# 11. Define a sum and set it to 0
# 12. Add the value of every item to the sum
# 13. Display the sum






# > --------------------
# > Welcome to Instacart
# > --------------------
# > In our store today:
# > kiwi: 1.25€
# > banana: 0.5€
# > mango: 4€
# > asparagus: 9€
# > --------------------
# > Which item? (or 'quit' to checkout)
# > kiwi
# > Which item? (or 'quit' to checkout)
# > pineapple
# > Sorry, we don't have pineapple today.
# > Which item? (or 'quit' to checkout)
# > mango
# > Which item? (or 'quit' to checkout)
# > quit
# > -------BILL---------
# > TOTAL: 5.25€
# > --------------------