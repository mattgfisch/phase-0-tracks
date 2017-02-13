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

  require_relative 'game'

  describe Game do 
    let(:game) {Game.new}

    it "inputs word" do
      expect(game.input_word("word")).to eq(game.word) 
    end
    
    it "increments guess count" do
      expect(game.increment_guess).to eq 1
    end

    it "reads guess count" do
      expect(game.guess_count).to eq 0
    end

    it "creates and stores guessed word" do
      expect(game.input_word("word")).to eq(["w", "o", "r", "d"])
      expect(game.create_guessed).to eq(["_", "_", "_", "_"])
    end

    it "prints guessed word" do
      expect(game.input_word("word")).to eq(game.word)
      expect(game.create_guessed).to eq(["_", "_", "_", "_"])
      expect(game.print_guessed).to eq("_ _ _ _ ")
    end

    it "checks if guess was already made" do
      expect(game.input_guess("h"))
      expect(game.check_if_previous_guess("h")).to eq(true)
      expect(game.check_if_previous_guess("y")).to eq(false)
    end

    it "compare guess to letter" do
      expect(game.input_word("word"))
      expect(game.input_guess("i"))
      expect(game.check_guess).to eq(false)
      expect(game.input_guess("o"))
      expect(game.check_guess).to eq(true)
    end

    it "update guessed word to include new letter" do
      expect(game.input_word("basketball"))
      expect(game.create_guessed)
      expect(game.input_guess("b"))
      expect(game.update_guessed_word).to eq(["b", "_", "_", "_", "_", "_", "b", "_", "_", "_"])
    end





  end