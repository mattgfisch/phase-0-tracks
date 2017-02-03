=begin PSEUDOCODE
  - Get name
  - Convert name to array
  - Swap first and last name
    - Split by ' '
    - Swap using helper variable (Is there a cleaner way?) (Used reverse)
      - helper = [0]
      - [0] = [1]
      - [1] = helper
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
end

# Split names into characters
def split_names(full_name)
  full_name.map! {|x| x.split('')}
end





#
#
# DRIVER CODE
#
#

full_name = get_name()

full_name = to_array(full_name)

swap_names(full_name)

p switch_vowels(full_name)



