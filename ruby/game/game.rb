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
  attr_accessor :word, :guess_count, :guess, :guessed_word, :is_over, :won_game, :already_guessed
  
  def initialize 
    @word = []
    @guess = ""
    @guessed_letters = []
    @already_guessed = false
    @guessed_word = []
    @guess_count = 0
    @is_over = false
    @won_game = true
  end

  def input_word(word)
    @word = word.split('')
  end

  def input_guess(guess)
      @guessed_letters << guess
      @guess = guess
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

  def print_guessed
    guessed_print = ""
    @guessed_word.each do |i|
      guessed_print = guessed_print + i + " "
    end
    puts "_"*20
    puts "Here is the word you are working on:"
    puts guessed_print
    puts "_"*20

    guessed_print
  end

  def check_if_previous_guess(guess)
    @guessed_letters.each do |letter|
      if letter == guess
        @already_guessed = true
      else
        @already_guessed = false
      end
    end
    @already_guessed
  end
end

# ----- USER INTERFACE

# game = Game.new

# puts "_"*20
# puts "Player 1, please type your word to be guessed:"
# puts "_"*20
# word = gets.chomp


# # Input word
# game.input_word(word)

# # Create empty guessed word
# game.create_guessed

# # Clear screen
# system "clear"

# # Loop until game is over
# while !game.is_over
  
#   # Display word as spaces + guessed char (guessed_word)
#   game.print_guessed
#   while !already_guessed do
#     # Input guess
#     puts "_"*20
#     puts "Player 2, type the letter you'd like to guess:"
#     puts "_"*20
#     g_letter = gets.chomp

#     # Check if already guessed
#     check_if_previous_guess(g_letter)

#     puts "_"*20
#     puts "Sorry that letter has already been guessed."
#     puts "_"*20
#   end
#   game.input_guess(g_letter)

   

#   # Loop until guess_count > word.length + 3
#   if game.guess_count > (game.word.length + 3)
#     game.won_game = false
#     game.is_over = true
#   end
#   game.is_over = true
# end


