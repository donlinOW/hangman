words = ["word", "ruby", "code", "hi"]
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

  if guessed_letters.include?(guess)
    puts "You already guessed that letter!"
    next
  end

  guessed_letters << guess
end