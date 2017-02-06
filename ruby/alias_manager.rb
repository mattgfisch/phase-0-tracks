=begin PSEUDOCODE
  - Get name
  - Convert name to array
  - Swap first and last name
    - Split by ' '
    - Swap using helper variable (Is there a cleaner way?) (Used reverse)
      - helper = [0]
      - [0] = [1]
      - [1] = helper
  - Split names into individual letters
  - Change all vowels (a, e, i, o, or u) to next vowel in sequence (loop)
    - Detect if a letter is a vowel 
      - If vowel, map next vowel in sequence
        - If 'u', change to 'a'
      - If not, do nothing
  - Change all consonants to next consonant in alphabet (loop)
    - Detect if letter is NOT a vowel 
      - If NOT a vowel, change to next consonant in alphabet
        - If next is vowel, check next until consonant, then map that
        - If 'z', change to 'b'
      - If vowel, do nothing
  - Print result
=end

#
#
# METHODS
#
#

# Get name to be scrambled
def get_name()
  puts "What is your real name?"
  gets.chomp
end

# Split name into array, each word being an element
def to_array(full_name)
  full_name.split(' ')
end

# Swap first and last name
def swap_names(full_name)
  full_name.reverse!
end

# Change vowels to next in sequence
def switch_vowels(full_name)
  split_names(full_name)
  next_vowel(full_name)
end

# Split names into characters
def split_names(full_name)
  full_name.map! {|x| x.split('')}
end

# Change to next vowel
def next_vowel(full_name)
  vowels = "aeiou"
  
  full_name.map!{|word|
    
    word.map!{|x|
      
      # vowels.each_char{|c|
        # case x.downcase #-----This is how I wanted to loop through the vowels, but I couldn't get it to work
        #   when c
        #     vowels[vowels.index(c) + 1]
        #   else
        #     x
        # end
      # }
      case x.downcase
        when vowels[0]
          x = vowels[1]
        when vowels[1]
          x = vowels[2]
        when vowels[2]
          x = vowels[3]
        when vowels[3]
          x = vowels[4]
        when vowels[4]
          x = vowels[0]
        else
          x
      end
    }
  }
end

#Switches consonant to next consonant in alphabetical order. Exception is that 'z' becomes 'b'
def switch_consonants(full_name)
  full_name.map!{|word|                     # Very unhappy with this section of code
    word.map!{|x|                           # Wanted to use a for loop by itself or within map, couldn't get it to work
      alphabet = "bcdfghjklmnpqrstvwxyz"
      
      case x.downcase 
        when alphabet[0]
          x = alphabet[1]
        when alphabet[1]
          x = alphabet[2]
        when alphabet[2]
          x = alphabet[3]
        when alphabet[3]
          x = alphabet[4]
        when alphabet[4]
          x = alphabet[5]
        when alphabet[5]
          x = alphabet[6]
        when alphabet[6]
          x = alphabet[7]
        when alphabet[7]
          x = alphabet[8]
        when alphabet[8]
          x = alphabet[9]
        when alphabet[9]
          x = alphabet[10]
        when alphabet[10]
          x = alphabet[11]
        when alphabet[11]
          x = alphabet[12]
        when alphabet[12]
          x = alphabet[13]
        when alphabet[13]
          x = alphabet[14]
        when alphabet[14]
          x = alphabet[15]
        when alphabet[15]
          x = alphabet[16]
        when alphabet[16]
          x = alphabet[17]
        when alphabet[17]
          x = alphabet[18]
        when alphabet[18]
          x = alphabet[19]
        when alphabet[19]
          x = alphabet[20]
        when alphabet[20]
          x = alphabet[0]
        else
          x
      end    

    }
  }
end

# Compacts first and last name from arrays of separate letters into two strings, then combines the names
def compact_letters(full_name)
  first_name = ""
  last_name = ""
  for i in 0...full_name[0].length
    first_name = first_name + full_name[0][i]
  end
  for i in 0...full_name[1].length
    last_name = last_name + full_name[1][i]
  end
  first_name.capitalize + " " + last_name.capitalize
end

# Prompts user if they would like to quit, or continue
def ask_quit()
  puts "Would you like to quit? Type 'quit' to exit or press enter to continue"
  gets.chomp
end

# Stores old and new names as keys within an agent key. Agent key is indexed to allow for multiple agents
def store_names(all_agents, new_name, old_name, num_agents)
  agent_sym = "agent" + num_agents.to_s
  agent_sym = agent_sym.to_sym

      all_agents[agent_sym][:old_name] = old_name
      all_agents[agent_sym][:new_name] = new_name
end

# Prints agents old name and new, scrambled name
def print_agents(all_agents)
  all_agents.each_key{|key| 
    p "For #{key.to_s}:"
    p "#{all_agents[key][:old_name]} is also known as #{all_agents[key][:new_name]}." 
  }
end



#
#
# DRIVER CODE
#
#

quit = ""
num_agents = 0
all_agents = Hash.new {|h,k| h[k] = Hash.new(&h.default_proc) } #Creates new hash, where default is set to have a nested hash

while quit != "quit" #Runs until user types 'quit' as response to ask_quit()
  full_name = get_name()

  old_name = full_name

  full_name = to_array(full_name)

  swap_names(full_name)

  switch_vowels(full_name)
   
  switch_consonants(full_name)

  new_name = compact_letters(full_name)

  store_names(all_agents, new_name, old_name, num_agents)

  quit = ask_quit()

  num_agents += 1
end

p "***************************************"
print_agents(all_agents)
p "***************************************"



