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
  # Based on won_game boolean

class Game
  attr_reader :word, :guess_count, :guess, :guessed_word, :is_over, :won_game
  
  def initialize 
    @word = []
    @guess = ""
    @guessed_word = []
    @guess_count = 0
    @is_over = false
    @won_game = true
  end

  def input_word(word)
    @word = word.split('')
  end

  def increment_guess
    @guess_count += 1
  end

  def create_guessed
    @word.each do
      @guessed_word << "_"
    end

    @guessed_word
  end

  def update_guessed

  end
end

# ----- USER INTERFACE

# game = Game.new

# puts "Player 1, please type your word to be guessed:"
# word = gets.chomp

# # Input word
# game.input_word(word)

# # Create empty guessed word

# # Loop until game is over
# while !game.is_over
  

#   # Loop until guess_count > word.length + 3
#   if game.guess_count > (game.word.length + 3)
#     game.won_game = false
#     game.is_over = true
#   end
# end


