def display(wishlist)
  wishlist.each_with_index do |wish, index|
    # wish is a Hash! e.g. {name: "Bike", bought: false}
    status = wish[:bought] ? "[X]" : "[ ]" # Ternary Operator
    puts "#{index + 1}. #{status} #{wish[:name]}"
  end
end
