#Initialize required variables
full_name = ""
age = 0
birth_year = 0
correct_age = false
allergy = ""
serve_garlic = false
health_insurance = false
num_employees = 0

#Compares age to birth year to see if age is accurate
def compare_age(age, birth_year)
  if (2017 - age) == birth_year
    return true
  else
    return false
  end
end

#Takes in all variable to determine likelihood of being a vampire and prints result
def determine_vampire(name, correct_age, serve_garlic, health_insurance, employee_num, allergy)
  vampire_scale = 0
  if correct_age && (serve_garlic || health_insurance)
    vampire_scale = 1
  end
  if !correct_age && (!serve_garlic || !health_insurance)
    vampire_scale = 2
  end
  if !correct_age && !serve_garlic && !health_insurance
    vampire_scale = 3
  end
  if name == "Drake Cula" || name == "Tu Fang"
    vampire_scale = 4
  end

  if allergy == "sunshine" #If employee gave allergy of "sunshine", skips other criteria and prints that they are "Probably a vampire"
    vampire_scale = 2
  end

  puts "*************************************"
  puts "        VAMPIRE TEST RESULTS"
  puts ""
  case vampire_scale
    when 0
      puts "Employee #{employee_num + 1}: Results inconclusive."
    when 1
      puts "Employee #{employee_num + 1}: Probably not a vampire."
    when 2
      puts "Employee #{employee_num + 1}: Probably a vampire."
    when 3
      puts "Employee #{employee_num + 1}: Almost certainly a vampire."
    when 4
      puts "Employee #{employee_num + 1}: Definitely a vampire"
  end
  puts "*************************************"
end

#
#
# DRIVER CODE
#
#
puts "How many employees would you like to process?"
num_employees = gets.chomp.to_i

if num_employees > 0 
  # Begin Employee Test Loop
  for i in 0..(num_employees - 1) 
    #Ask for name
    puts "What is your full name?"
    full_name = gets.chomp

    #Ask and compare age to year born
    puts "How old are you?"
    age = gets.chomp.to_i

    puts "What year were you born?"
    birth_year = gets.chomp.to_i

    correct_age = compare_age(age, birth_year)

    #Ask for list of allergies via a loop. If "sunshine" is mentioned, skip rest and assume "Probably a vampire"
    puts "Please list your allergies, hitting ENTER after each entry. Type 'done' + ENTER when finished."
    allergy = "blank"
    until (allergy == "sunshine") || (allergy == "done")
     allergy = gets.chomp
    end

    #If employee lists "sunshine" as allergy, the next section is skipped
    if allergy != "sunshine"
      
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
    end
    # End of (allergy = "sunshine") skipped section

    #Conduct vampire test
    determine_vampire(full_name, correct_age, serve_garlic, health_insurance, i, allergy)
  end 
  # End employee test loop
else
  puts "I guess you don't want to process any employees. Have a good day!"
end 

# Final, fun message
puts "Actually, never mind! What do these questions have to do with anything? Let's all be friends"


