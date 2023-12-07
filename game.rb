require_relative 'player'
require_relative 'colors'
require_relative 'greetings'

class Game
  VALID_CHOICE = ["1","2","3","4","5","6"]
  CODE_BREAKER = 'CODE-BREAKER'.blue
  CODE_MAKER = 'CODE-MAKER'.yellow #{CODE_BREAKER}
  SELECT_GUESSES = 'Select number of guesses: 16 for ' << 'easy'.blue << ', 12 for ' << 'normal'.green << ', 8 for ' << 'hard'.red
  CHOOSE_FOUR = "Choose 4 of the following: " << "\u278a".red << ' ' << "\u278b".green << ' ' << "\u278c".yellow<< ' ' << "\u278d".blue<< ' ' << "\u278e".pink << ' ' << "\u278f".gray

  def initialize
    @board = []
    @feedback = []
    @code = []
    @guess = []
    @round = 0
    @difficulty
    @pegs = []
    @player = 2
  end
  
  def code_maker?
    puts "Type [1] to be the #{CODE_MAKER}, [2] to be the #{CODE_BREAKER}"
    a = gets.chomp.to_i
    @player = a if a == 1
  end

  def user_input
    @input = gets.chomp
    unless (@input.chars.all? { |e| VALID_CHOICE.include?(e) } && @input.chars.size == 4)
      puts 'Invalid code, choose 4 numbers between 1 and 6'
      user_input
    end
    
  end

  def difficulty
    puts SELECT_GUESSES
    @difficulty = gets.chomp.to_i
    unless [8,12,16].include?(@dificulty)
      @dificulty
    end
  end

  def guess
    if @player == 2
      puts 'Enter your guess: '
      user_input
    else
      gen_code
    end
    @pegs[@round] = Player.input(@input)
    @guess[@round] = @input.chars
    @input = nil
  end

  def code
    code_maker?
    @player==1 ? set_code : gen_code
  end

  def gen_code
    @input = Player.create_code
    if @player == 2 
       @code = @input.chars
       @input = nil
    else
       @guess = @input.chars
    end
    
  end

  def set_code
    puts 'Enter the code: '
    user_input
    clear_screen
    @code = @input.chars
    @input = nil
  end

  def show_choices
    clear_screen
    puts CHOOSE_FOUR
  end

  def feedback
    @feedback[@round] = Player.feedback(@code, @guess[@round])
  end

  def print_board
    show_choices
    (0..@round).each do |i|
      puts "#{@pegs[i]} | #{@feedback[i]}"
    end
    if @player == 1
      puts "Hit enter for computer's next guess"
      gets
    end
  end

  def clear_screen
    system('clear')
    system('cls')
  end

  def play
    show_choices
    until win? || end?
      guess
      feedback
      print_board
      @round += 1
    end
  end

  def game_end
    if win?
      puts "Amazing, the  #{CODE_BREAKER} won!"
    else
      puts "The #{CODE_BREAKER} lost, the code was #{Player.input(@code.join)}"
    end
  end

  def end?
    return unless @round == @difficulty

    true
  end

  def win?
    return unless @guess[@round - 1] == @code

    true
  end

  def reset
    puts 'Do you want to play again? [Y/N] :'
    true if gets.chomp.upcase == 'Y'
  end

  def start
    Greetings.say_hi
    difficulty
    code
    play
    game_end
  end
end
