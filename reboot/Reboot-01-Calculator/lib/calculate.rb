def calculate(first_number, second_number, operator)
  case operator
  when "+"
    return first_number + second_number
  when "-"
    return first_number - second_number
  when "*"
    return first_number * second_number
  when "/"
    return first_number.to_f / second_number
  else 
    return nil
  end
end
