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
  attr_accessor :word, :guess_count, :guess, :guessed_word, :guessed_letters, :is_over, :won_game, :already_guessed
  
  def initialize 
    @word = []
    @guess = ""
    @guessed_letters = []
    @already_guessed = true
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
    if @guessed_letters.length > 0
 
      @guessed_letters.each do |letter|
        
        if letter == guess
          @already_guessed = true
          break
        else
          @already_guessed = false
        end

      end
    else
      @already_guessed = false
    end

    @already_guessed
  end
  
  def check_guess
    # Checks guess
    correct_guess = false
    
    @word.each do |letter|
      if @guess == letter.downcase
        correct_guess = true
      else
        correct_guess
      end  

    end

    correct_guess 
  end

  def print_guesses_remaining
    guesses_remaining = @word.length + 3 - @guess_count
    puts "_"*20
    puts "Guesses remaining: #{guesses_remaining}"
    puts "_"*20
  end

  def update_guessed_word()
    l_index = 0
    @word.each do |letter|
      if letter.downcase == @guess
        @guessed_word[l_index] = letter
      else
        @guessed_word
      end
      #Increment index within word
      l_index += 1
    end

    @guessed_word
  end  

end

# ----- USER INTERFACE

game = Game.new

puts "_"*20
puts "Player 1, please type your word to be guessed:"
puts "_"*20
word = gets.chomp


# Input word
game.input_word(word)

# Create empty guessed word
game.create_guessed

# Clear screen
system "clear"

# Loop until game is over
while !game.is_over
  
  # Display word as spaces + guessed char (guessed_word)
  game.print_guessed
  while game.already_guessed do
    # Input guess
    puts "_"*20
    puts "Player 2, type the letter you'd like to guess:"
    puts "_"*20
    g_letter = gets.chomp

    # Clear screen
    system "clear"

    # Check if already guessed
    game.check_if_previous_guess(g_letter)

    # Print statement if letter has already been guessed
    if game.already_guessed
      puts "_"*20
      puts "Sorry the letter '#{g_letter}' has already been guessed."
      puts "_"*20

      game.print_guessed
    end
  end

  # Input guessed letter
  game.input_guess(g_letter)

  # Increment guess count
  game.increment_guess

  # Check guess
  game.check_guess

  # Update guessed word based on if the letter guessed was correct
  if game.check_guess
    
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
   
  

  # Loop until guess_count > word.length + 3
  if game.guess_count > (game.word.length + 2)
    game.is_over = true
  end

  # Reset already_guessed for new guess
  game.already_guessed = true

end


