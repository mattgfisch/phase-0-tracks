#Initialize required variables
full_name = ""
age = 0
birth_year = 0
correct_age = false
serve_garlic = false
health_insurance = false

#Compares age to birth year to see if age is accurate
def compare_age(age, birth_year)
  if (2017 - age) == birth_year
    return true
  else
    return false
  end
end

#Takes in all variable to determine likelihood of being a vampire and prints result
def determine_vampire(name, correct_age, serve_garlic, health_insurance)
  vampire_scale = 0
  if correct_age && (serve_garlic || health_insurance)
    vampire_scale = 1
  elsif !correct_age && (!serve_garlic || !health_insurance)
    vampire_scale = 2
  elsif !correct_age && !serve_garlic && !health_insurance
    vampire_scale = 3
  elsif name == "Drake Cula" || name == "Tu Fang"
    vampire_scale = 4
  end

  puts "*************************************"
  puts "        VAMPIRE TEST RESULTS"
  puts ""
  case vampire_scale
    when 0
      puts "Results inconclusive."
    when 1
      puts "Probably not a vampire."
    when 2
      puts "Probably a vampire."
    when 3
      puts "Almost certainly a vampire."
    when 4
      puts "Definitely a vampire"
  end
  puts "*************************************"
end

#
#
# DRIVER CODE
#
#

#Ask for name
puts "What is your full name?"
full_name = gets.chomp

#Ask and compare age to year born
puts "How old are you?"
age = gets.chomp.to_i

puts "What year were you born?"
birth_year = gets.chomp.to_i

correct_age = compare_age(age, birth_year)

#Ask if user wants garlic bread. Converts to boolean
puts "Our company cafeteria serves garlic bread. Should we order some for you (y/n)?"
response = false

until response
  serve_garlic = gets.chomp
  if serve_garlic == "y"
    serve_garlic = true
    response = true
  elsif serve_garlic == "n"
    serve_garlic = false
    response = true
  else
    puts "Please respond with (y/n)."
  end
end

#Ask if user wants insurance. Converts to boolean
puts "Would you like to enroll in the company's health insurance (y/n)?"
response = false

until response
  health_insurance = gets.chomp
  if health_insurance == "y"
    health_insurance = true
    response = true
  elsif health_insurance == "n"
    health_insurance = false
    response = true
  else
    puts "Please respond with (y/n)."
  end
end

