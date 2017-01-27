full_name = ""
age = 0
birth_year = 0
serve_garlic = false
health_insurance = false 

#Ask for name
puts "What is your full name?"
full_name = get.chomp

#Ask and compare age to year born
puts "How old are you?"
age = gets.chomp.to_i

puts "What year were you born?"
birth_year = gets.chomp.to_i

puts "Our company cafeteria serves garlic bread. Should we order some for you?"
serve_garlic = gets.chomp

puts "Would you like to enroll in the company's health insurance?"
health_insurance = gets.chomp
