#
#
#
# RELEASE 1
#
#
#

superheroes = {
  batman: "Bruce Wayne",
  superman: "Clark Kent",
  catwoman: "Selena Kyle",
  sailor_moon: "Usagi Tsukino"
}

times_of_day = ["dawn", "morning", "afternoon", "evening", "twilight", "dusk", "night"]

puts "Original data before modification:"
p superheroes
p times_of_day

# Demonstrate .each
superheroes.each {|secret_id, identity|
  puts "Secret identity of #{secret_id} is #{identity}."
}

times_of_day.each{|time|
  puts time 
}

#Demonstrate .map!
times_of_day.map!{|time|
  time + " today"
}

p times_of_day

#
#
#
# RELEASE 2
#
#
#
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

digit_to_word = {
  1 => "one",
  2 =>  "two",
  3 =>  "three",
  4 =>  "four",
  5 =>  "five",
  6 =>  "six",
  7 =>  "seven",
  8 =>  "eight",
  9 =>  "nine",
  10 =>  "ten"
}
puts "Before modification:"
p numbers
p digit_to_word

# Uncomment case that you wish to test

# CASE 1: .delete_if
numbers.delete_if{|num| num < 5}
digit_to_word.delete_if{|num, word| num < 5}

# CASE 2: .keep_if
# numbers.keep_if{|num| num < 5}
# digit_to_word.keep_if{|num, word| num < 5}

# CASE 3: .select!
# numbers.select!{|num| num > 7}
# digit_to_word.select!{|num, word| num > 7}

# CASE 4 : .take_while
# new_numbers = []
# new_numbers = numbers.take_while{|num| num < 6}



puts "After modification:"
# p new_numbers #Uncomment only for Case 4 
p numbers # Use for cases 1-3
p digit_to_word