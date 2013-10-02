

# A user should be given a menu of operations
# A user should be able to choose from the menu
def menu
  puts "Welcome to the calculator, please choose from the following options:
  B : Basic Calculator
  A : Advanced Calculator
  Q : Quit"

  menu_response = gets.chomp.downcase

end



# A user should be able to enter numbers to perform the operation on
# A user should be shown the result
def basic_calc ()
  print "Please choose from the following options:
(a)dd, (s)ubtract, (m)ultiply, (d)ivide, (r)eturnt to main menu : "
    basic_menu_request = gets.chomp.downcase
      case basic_menu_request
        when "a"
          print "What is the first number?   "
            first = gets.chomp.to_f
          print "What is the second number?  "
            second = gets.chomp.to_f
          answer = first + second
            puts "The answer is #{answer}"
        when "s"
          print "What is the first number?   "
            first = gets.chomp.to_f
          print "What is the second number?  "
            second = gets.chomp.to_f
          answer = first - second
            puts "The answer is #{answer}"
        when "m"
          print "What is the first number?   "
            first = gets.chomp.to_f
          print "What is the second number?  "
            second = gets.chomp.to_f
          answer = first * second
            puts "The answer is #{answer}"
        when "d"
          print "What is the first number?   "
            first = gets.chomp.to_f
          print "What is the second number?  "
            second = gets.chomp.to_f
          answer = first / second
            puts "The answer is #{answer}"
        when "r"
          puts menu
        else
          print "That is not a valid command. "
          puts basic_calc
      end

end


def advanced_calc ()
  print "Please choose from the following options:
(p)ower, (s)qrt, (r)eturnt to main menu : "
    advanced_menu_request = gets.chomp.downcase
    case advanced_menu_request
      when "p"
        print "What is the number? "
          first = gets.chomp.to_f
        print "to the power of?    "
          power = gets.chomp.to_f
        answer = (first**power)
          puts "The answer is #{answer}"
      when "s"
        print "What is the number you would like the square root of? "
          x = gets.chomp.to_f
        sqrt = Math.sqrt(x)
        puts "The answer is #{sqrt}"
      when "r"
        puts menu
      else
        print "That is not a valid command. "
        puts advanced_calc
    end
end


menu_response = menu

# This process should continue until the user selects a quit option from the menu
while menu_response != 'q'
  if menu_response == 'b'
    puts basic_calc
    puts menu
  elsif menu_response == 'a'
    puts advanced_calc
    puts menu
  else
    print "That is not a valid command. "
    puts menu
  end
  menu_response = gets.chomp.downcase
end
# Display an exit response
puts "Goodbye"