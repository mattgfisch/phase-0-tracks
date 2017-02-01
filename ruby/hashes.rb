
# DESCRIPTION: 
# A program that will allow an interior designer 
# to enter the details of a given client: the client's name, age, number 
# of children, decor theme, and so on (you can choose your own as long as 
# it's a good mix of string, integer, and boolean data).

# PSEUDOCODE:
# - Create empty hash
# - Prompt user for information; repeat until all info is in hash
#   - Ask question
#   - Take in data
#   - Convert to proper data type
#   - Add w/key to hash
# - Print hash out to screen
# - Give opportunity to update key
#   - Prompt for which key
#     - If response == none, skip
#     - Else
#       - Based on answer, prompt for new value for given key
# - Print new hash
   
#
#
#
# DRIVER CODE
#
#
#

# Create new hash
client_details = Hash.new

# Prompt user for information, store with corresponding key
puts "What is your client's name?"
full_name = gets.chomp
client_details.store(:name, full_name)

puts "What is your client's age?"
age = gets.chomp.to_i
client_details.store(:age, age)

puts "How many children does your client have?"
num_children = gets.chomp.to_i
client_details.store(:num_children, num_children)

puts "What theme would your client like to have?"
theme = gets.chomp
client_details.store(:theme, theme)

puts "Would your client like to spend over $10,000? (y/n)"
over_10_grand = gets.chomp
if over_10_grand == "y"
  over_10_grand = true
else
  over_10_grand = false
end
client_details.store(:over_10_grand, over_10_grand)


# Print hash
p client_details

# Prompt if user wants to change any information
# If they do, prompt for value for given decor
puts "Which key would you like to change? If none, type 'none'."
key = gets.chomp.to_sym

if key == :none
# If 'none' is response, then skip to end

else
  puts "What would you like it changed to?"
  puts "It's currently: #{client_details[key]}"
  new_value = gets.chomp     #Get new value

  value_class = client_details[key].class #Stores class value to variable
 
  if value_class == "string".class #Take action based on class of target value
    new_value
  elsif value_class == 1.class
    new_value.to_i
  elsif value_class == true.class || value_class == false.class
    if new_value == "true"
      new_value = true
    else
      new_value = false
    end
  end   

  client_details.store(key, new_value) #Store new value in hash
end


puts "**********NEW HASH***********"
p client_details


