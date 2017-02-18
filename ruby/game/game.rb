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
    # Break if no '_' left in guessed_word array
      # Declare 
# Print either win or lose
  # Based on won_game boolean

class Game
  attr_accessor :word, :is_over, :won_game
  attr_reader :guessed_word, :guessed_letters

  def initialize(word) 
    @word = word
    @guessed_letters = []
    @guessed_word = []
    @is_over = false
    @won_game = true
  end

  def split_word
    @word.split('')
  end

  def input_guess(guess)
      @guessed_letters << guess
  end

  def create_guessed
    split_word.each do
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

  def print_guesses_remaining
    guesses_remaining = @word.length + 3 - @guessed_letters.length
    puts "_"*20
    puts "Guesses remaining: #{guesses_remaining}"
    puts "_"*20
  end

  def update_guessed_word
    l_index = 0
    split_word.each do |letter|
      if letter.downcase == @guessed_letters.last
        @guessed_word[l_index] = letter
      else
        @guessed_word
      end
      #Increment index within word
      l_index += 1
    end

    @guessed_word
  end

  def check_game_over
    if @guessed_word.index("_") == nil
      @is_over = true
    else
      @is_over
    end
  end  

end

# ----- USER INTERFACE

puts "_"*20
puts "Player 1, please type your word to be guessed:"
puts "_"*20
word = gets.chomp

# Create new instance of game and input word
game = Game.new(word)

# Create empty guessed word
game.create_guessed

# Clear screen
system "clear"

# Loop until game is over
while !game.is_over
  
  # Display word as spaces + guessed char (guessed_word)
  game.print_guessed

  # Input guess
  puts "_"*20
  puts "Player 2, type the letter you'd like to guess:"
  puts "_"*20
  g_letter = gets.chomp

  # Clear screen
  system "clear"

  # Check if letter was already guessed
  while game.guessed_letters.include?(g_letter) do
    
    # Print statement if letter has already been guessed
    puts "_"*20
    puts "Sorry the letter '#{g_letter}' has already been guessed."
    puts "_"*20

    game.print_guessed

    # Input guess
    puts "_"*20
    puts "Player 2, type the letter you'd like to guess:"
    puts "_"*20
    g_letter = gets.chomp

    # Clear screen
    system "clear"
  end

  # Input guessed letter
  game.input_guess(g_letter)

  # Update guessed word based on if the letter guessed was correct
  if game.split_word.include?(g_letter)
    
    game.update_guessed_word

    puts "_"*20
    puts "Congratulations, you guessed correctly!"
    puts "_"*20
  else
    puts "_"*20
    puts "Sorry, your guess was incorrect!"
    puts "_"*20
  end

  # Print how many guesses the user has left
  game.print_guesses_remaining
   
  # Check to see if user has completed the word. If true, break and end game
  break if game.check_game_over

  # Loop until guess_count > word.length + 3
  if game.guessed_letters.length > (game.word.length + 2)
    game.is_over = true
    game.won_game = false
  end

end

if game.won_game
  puts "_"*20
  puts "CONGRATULATIONS! PLAYER 2 WON THE GAME!"
  puts "_"*20
else
  puts "_"*20
  puts "CONGRATULATIONS! PLAYER 2 IS COMPLETELY INEPT AT GUESSING AND LOST THE GAME!"
  puts "_"*20
end


