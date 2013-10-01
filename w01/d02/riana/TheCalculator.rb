#Epic Calculator
#global variable for the final calculation total
#first menu should allow user to select basic or advance operations
def determine_operators
  #prompt the user for a selection
  print "Please select (B)asic or (A)dvanced calculator operations:"
  #store the selection
  calc_operations = gets.chomp.downcase
  #determine which operators to display and call their associated methods
  if calc_operations == 'b'
      display_basic_operators
  elsif calc_operations == 'a'
      display_advanced_operators
  else
    puts "Please only select (B)asic or (A)dvanced calculator operations:"
  end
end

#if basic operations have been selected the add, subtract, multiple and divide operations should be available
def display_basic_operators
  #prompt user to chose an operator
  puts "Please select a Basic operation type: \n (A)dd \n (S)ubtract \n (M)ultiply \n (D)ivide"
  print "> "
  basic_operation = gets.chomp.downcase
  case basic_operation
  when 'a'
    puts "Add selected"
    get_values(basic_operation)
  when 's'
    puts "Subtract selected"
    get_values(basic_operation)
  when 'm'
    puts "Multiply selected"
    get_values(basic_operation)
  when 'd'
    puts "Divide selected"
    get_values(basic_operation)
  else
    puts "I didn't recognise your selection. Please only pick a Basic operation type: \n (A)dd \n (S)ubtract \n (M)ultiply \n (D)ivide"
  end
end

#if advance operations have been selected the exponent and square root operations should be available
def display_advanced_operators
  puts "Please select an Advanced operation type: \n (E)xponent \n (S)quare root"
  print "> "
  advanced_operation = gets.chomp.downcase
  case advanced_operation
    when 'e'
      puts "Exponent selected"
      print "Please enter the base value that needs to be multiplied: "
      base = gets.chomp.to_i
      if base > 0
        print "Please enter the exponent value that needs to be applied to the base: "
        power = gets.chomp.to_i
        puts "Total #{base**power}"
      else
        "Please enter a value greater than zero for the calculation."
      end
    when 's'
      puts "Square root selected"
      print "Please enter a value to determine the square root: "
      sq_value = gets.chomp.to_f
      puts "Total #{Math.sqrt(sq_value)}"
    else
    puts "I didn't recognise your selection. Please only pick an Advanced operation type: \n (E)xponent \n (S)quare root \n > "
  end
end

#if the user has selected an operation, gather the values to be used in the calculation and apply validation
def get_values(basic_operation)
  done = false
  total = 0
  calc_value = 0

  print "Enter a value for the calculation: "
  calc_value = gets.chomp.to_f

  #keep asking for values until the user chooses to stop
  while !done
      print "#{calc_value} entered, continue?(Y/N)"
      continue = gets.chomp.downcase

    #check if the user wants to include additional values for the calculation
    if continue == 'y'
      total = calc_value
      print "Enter a value to be calculated: "
      calc_value = gets.chomp.to_f
      #when the user elects to stop adding values pass the array to a method that handles the calc based on the operation
    elsif continue == 'n'
      case basic_operation
        when 'a'
          total += calc_value
        when 's'
          total -= calc_value
        when 'm'
          total *= calc_value
        when 'd'
          total /= calc_value
      end
      done = true
    else
      puts "Please enter Y or N so I know what to do next."
    end
  end

  puts "Total: #{total}"
end

determine_operators

