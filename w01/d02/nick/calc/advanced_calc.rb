def advanced_calc
  print "(p)ower, (s)qrt: "
  command = gets.chomp.downcase
  # unless command == "p" || command == "s"
  #  puts "Sorry, that's not a valid command"
  #  command = gets.chomp
    if command == "p"
      first_num = get.chomp
      answer = first_num ** get.chomp
    else
      answer = Math.sqrt(get.chomp)
    end
end