
def menu()
  puts "Please select one of the following options:
  A: Advanced Calculator
  B: Basic Calculator
  Q: Quit the program "
  gets.chomp.downcase
end

def basic_calc()
  puts "Menu: (a)dd, (s)ubtract, (m)ultiply, (d)ivide, (q)uit"
  basic_calc_choice= gets.chomp.downcase
case basic_calc_choice

when 'a'
  puts "Addition"
  puts "first number?"
    first_number = gets.chomp.to_i
  puts "second number?"
    second_number = gets.chomp.to_i
  answer = first_number + second_number
      puts "Your answer is #{answer}"


  when 's'
    puts "Subtraction"
    puts "first number?"
      first_number = gets.chomp.to_i
    puts "second_number?"
      second_number = gets.chomp.to_i
    answer = first_number - second_number
      puts "Your answer is #{answer}"


  when 'm'
    puts "Multiply"
    puts "first number?"
      first_number = gets.chomp.to_i
    puts "second_number?"
      second_number = gets.chomp.to_i
    answer = first_number * second_number
      puts "Your answer is #{answer}"

  when 'd'
    puts "Divide"
    puts "first number?"
      first_number = gets.chomp.to_i
    puts "second_number?"
      second_number = gets.chomp.to_i
    answer = first_number / second_number
      puts "Your answer is #{answer}"
 end
end

def advanced_calc
  print "(p)ower, (s)qrt: "
  advanced_calc_choice = gets.chomp.downcase


case advanced_calc_choice
  when 'p'
    puts "first number?"
      first_number = gets.chomp.to_i
    puts "to the power of?"
      second_number = gets.chomp.to_i
      answer = first_number ** second_number
      puts "Your answer is #{answer}"


  when 's'
  puts "what number do you the square root of ?"
   first_number = gets.chomp.to_i
   answer =  sqrt(first_number)
      puts "Your answer is #{answer}"
end
end

response = menu
while response != 'q'
  response = menu
 if response == 'b'
  answer = basic_calc
elsif response == 'a'
  answer = advanced_calc_choice
end
end