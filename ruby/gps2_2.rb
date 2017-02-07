# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps: 
  # create a Hash
  # split the string into an array, separate by " "
  # set default quantity
  # iterate through the array, with parameter |item|
    # convert the item from a string to a symbol
    # add item to the Hash as a key, with the default quantity as the value
  # print the list to the console using print list method (pass it the hash)
# output: the hash

# Method to add an item to a list
# input: list, item name, and optional quantity (default to default_quantity)
# steps: 
  # add key value pair of item and quantity to the list
# output: list

# Method to remove an item from the list
# input: list, item name
# steps: 
  # delete item from the list (use .delete method)
# output: list

# Method to update the quantity of an item
# input: list, item name, quantity (not optional)
# steps: 
  # set the element of the list with the item name to the quantity
# output: list

# Method to print a list and make it look pretty
# input: a hash of items and quantities
# steps: 
  # print a border made of "*"s
  # print a title
  # iterate over the hash, getting the items and quanities
    # convert each items/quantity to a string
    # print string to screen
# output: (implicit nil)


def create_list(items_string)
  default_quantity = 1

  grocery_list = Hash.new{|hash, key| hash[key] = default_quantity}
  items_array = items_string.split(" ")
  
  items_array.each do |item| 
    grocery_list[item.to_sym]
  end
  print_list(grocery_list)
  grocery_list
end

def add_item(list, item, quantity="not specified")
  if quantity == "not specified"
    list[item.to_sym]
  else
    list[item.to_sym] = quantity
  end
  list
end

def delete_item(list, item)
  list.delete(item.to_sym)
  list
end

def update_list(list, item, quantity)
  if list.include?(item.to_sym)
    list[item.to_sym] = quantity
  end
  list
end

def print_list(list)
  puts "**************************************************"
  puts "Grocery List:"
  list.each do |item,quantity|
    puts "#{item.to_s.capitalize}  -  #{quantity}"
  end
  puts "**************************************************"
end

#########################################################
# Driver Code

# grocery_list = create_list("soup greens chocolate")
# add_item(grocery_list, "corn")
# add_item(grocery_list, "popcorn", 3)
# p grocery_list
# delete_item(grocery_list,"soup")
# p grocery_list
# update_list(grocery_list,"greens",5)
# update_list(grocery_list,"flour",4)
# print_list(grocery_list)

new_list = create_list("")
print_list(new_list)

add_item(new_list, "lemonade", 2)
add_item(new_list, "tomatoes", 3)
add_item(new_list, "onion")
add_item(new_list, "ice cream", 4)

delete_item(new_list, "lemonade")

update_list(new_list, "ice cream", 1)

print_list(new_list

#########################################################
# REFLECTION
=begin

   - I learned how to split apart a method into different sections and detail each one.
   Breaking each method into input, steps, and output made it much easier to write the method
   afterword. 

   - For this challenge, an array would have been easier to iterate through, but a hash organizes
   the data in clearer fashion. Using an array worked well for splitting up the string of items into
   separate words, but a hash made assigning quantities to keys much easier.

   - A method returns either the return of the last line of code, or what you explicitly specify it
   to return.

   - You can pass through most data types and you can even set parameters to be optional or have a default value.

   - You can pass information between methods by calling a method within a method, with parameters that are contained
   in the outer method.

   - I have a much better understanding of how to use .each and how to use a return of a method to your
   advantage. For example, having a method return an object and store it by including the method call as part 
   of an assignment. I'm pretty clear on everything else, but I would still like more practice with .each and .map
   and other ways of iterating through data structures. 


=end