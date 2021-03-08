class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  
  def self.random_word 
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.size, '_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char) 
    if attempted_chars.include?(char) 
      true
    else 
      false
    end
  end

  def get_matching_indices(char)
    matching_indices = []
    @secret_word.each_char.with_index do |c, i|
      if c == char
        matching_indices << i
      end
    end
    matching_indices
  end

  def fill_indices(char, arr_ind)
    arr_ind.each do |i|
      @guess_word[i] = char
    end
  end

  def try_guess(char)
    if already_attempted?(char)
      puts "that has already been attempted"
      return false
    else 
      @attempted_chars << char
      if get_matching_indices(char).empty?
        @remaining_incorrect_guesses -= 1
      end
      fill_indices(char, get_matching_indices(char))
    end
    true
  end

  def ask_user_for_guess
    puts "Enter a char: "
    char = gets.chomp
    try_guess(char)
  end

  def win?
    guess = @guess_word.join("")
    if guess == @secret_word
      puts "WIN"
      return true
    end
    false
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts "LOSE"
      return true
    end
    false
  end

  def game_over?
    if win? || lose?
      puts @secret_word
      return true
    end
    false
  end

end

