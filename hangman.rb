class Hangman
  def initialize(file_path)
    @words = File.readlines(file_path).map(&:chomp)
    @word = @words.sample
    @lives = 9
    @guessed_letters = []
    @display = "_" * @word.length
  end

  def play
    until game_over?
      display_status
      guess = prompt_guess
      process_guess(guess)
    end
    display_result
  end

  private

  def game_over?
    @lives == 0 || @display == @word
  end

  def display_status
    puts "Word: #{@display.split('').join(' ')}"
    puts "Lives: #{@lives}"
    puts "Guessed Letters: #{@guessed_letters.join(', ')}"
  end

  def prompt_guess
    print "Guess a letter: "
    guess = gets.chomp.downcase
    until valid_guess?(guess)
      puts "Invalid input, please enter a single letter!"
      print "Guess a letter: "
      guess = gets.chomp.downcase
    end
    guess
  end

  def valid_guess?(guess)
    guess.length == 1 && ('a'..'z').include?(guess)
  end

  def process_guess(guess)
    if @guessed_letters.include?(guess)
      puts "You already guessed that letter!"
    else
      @guessed_letters << guess
      update_game_state(guess)
    end
  end

  def update_game_state(guess)
    if @word.include?(guess)
      @word.chars.each_with_index do |char, index|
        @display[index] = guess if char == guess
      end
    else
      @lives -= 1
    end
  end

  def display_result
    if @display == @word
      puts "Congratulations! You guessed the word: #{@word}"
    else
      puts "Game over! The word was: #{@word}"
    end
  end
end

game = Hangman.new('words.txt')
game.play