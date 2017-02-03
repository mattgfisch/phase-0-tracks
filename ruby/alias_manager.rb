=begin PSEUDOCODE
  - Get name
  - Convert name to array
  - Swap first and last name
    - Split by ' '
    - Swap using helper variable (Is there a cleaner way?)
      - helper = [0]
      - [0] = [1]
      - [1] = [0]
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

def get_name()
  puts "What is your real name?"
  gets.chomp
end







#
#
# DRIVER CODE
#
#

full_name = get_name()

p full_name
