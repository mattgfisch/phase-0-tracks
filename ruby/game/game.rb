# ----- PSEUDOCODE
# Input word
  # Loop until guess_count > word.length + 3
    # Display word as spaces + guessed char (guessed_word)
    # Input guess (char)
    # Compare guess to word
    # Check if char already guessed
        # If so, prompt again
    # Increment guess_count by 1
    # Loop through array of word char's
      # If guess = char in word, modify guessed_word at index
        # Print correct guess
      # Else
        # Print incorrect guess
# Print either win or lose
  # Based on calculate_win method and won_game boolean

class Game
  attr_reader :word
  
  def initialize 
    @word = ""
  end

  def input_word(word)
    @word = word
  end
end