
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
   
client_details = Hash.new

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

p client_details


