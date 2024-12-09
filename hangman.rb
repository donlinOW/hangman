words = File.readlines('words.txt').map(&:chomp)
word = words.sample

lives = 9
guessed_letters = []
display = "_" * word.length

until lives == 0 || display == word
  puts "Word: #{display.split('').join(' ')}"
  puts "Lives: #{lives}"
  puts "Guessed Letters: #{guessed_letters.join(', ')}"
  puts "Guess a letter: "
  guess = gets.chomp.downcase

  if guess.length != 1 || !('a'..'z').include?(guess)
    puts "Invalid input, please enter a single letter!"
    next
  end

  if guessed_letters.include?(guess)
    puts "You already guessed that letter!"
    next
  end

  guessed_letters << guess

  if word.include?(guess)
    word.chars.each_with_index do |char, index|
      if char == guess
        display[index] = guess
      end
    end
  else
    lives -= 1
  end
end

if display == word
  puts "Congratulations! You guessed the word: #{word}"
else
  puts "Game over! The word was: #{word}"
end