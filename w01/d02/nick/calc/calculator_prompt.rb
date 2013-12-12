# A user should be given a menu of operations
# A user should be able to choose from the menu

def menu

  puts "which calculator do you want, (b)asic or (a)dvanced? Press (q) at any time to quit."
    gets.chomp.downcase
end

# A user should be able to enter values to perform the operation on
# A user should be shown the result

def basic_calc
  print "(a)dd, (s)ubtract, (m)ultiply, (d)ivide: "
  response = gets.chomp.downcase

  def first_q
    puts "What's your first number?"
  end

  def second_q
    puts "What's your second number?"
  end

case response

    when "a"
      question = first_q #{}
      first_num = gets.chomp.to_i
      question = second_q #{}
      second_num = gets.chomp.to_i
      answer = first_num + second_num

    when "s"
      question = first_q #{}
      first_num = gets.chomp.to_i
      question = second_q #{}
      second_num = gets.chomp.to_i
      answer = first_num - second_num

    when "m"
      question = first_q #{}
      first_num = gets.chomp.to_i
      question = second_q #{}
      second_num = gets.chomp.to_i
      answer = first_num * second_num

    when "d"
      question = first_q #{}
      first_num = gets.chomp.to_i
      question = second_q #{}
      second_num = gets.chomp.to_i
      answer = first_num / second_num

end

puts "The answer is #{answer}"

end

response = menu

# This process should continue until the user selects a quit option from the menu

while response != 'q'

  if response == 'b'
    puts "Welcome to basic calculator"
      basic_calc
  # elsif response == 'a'
  #   puts "Welcome to advanced calculator"
  #     value =
  end

end