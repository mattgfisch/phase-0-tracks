hamster_name = ""
volume_level = 0
fur_color = ""
adoption_candidate = false
estimated_age = nil


puts "What is you hamster name?"
hamster_name = gets.chomp


puts "What is you hamster volume level (1-10)?"
volume_level = gets.chomp.to_i


puts "What is you hamster fur color?"
fur_color = gets.chomp


puts "Is this hamster and adoption candidate?(y/n)"
adoption_candidate = gets.chomp

if adoption_candidate == "y" || adoption_candidate == "yes"
  adoption_candidate = true
else
  adoption_candidate = false
end


puts "About how old is your hamster?"
estimated_age = gets.chomp.to_i


puts "*************************************"
puts "           HAMSTER DATA"
puts ""
puts "Name: #{hamster_name}"
puts "Volume Level: #{volume_level}"
puts "Fur Color: #{fur_color}"
puts "Valid Adoption Candidate: #{adoption_candidate}"
puts "Estimated Age: #{estimated_age} years old"
puts "*************************************"