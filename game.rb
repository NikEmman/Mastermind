require_relative 'player'
require_relative 'colors'
require_relative 'greetings'
require 'pry-byebug'
# This is my Game class, rubycop stop pestering me
class Game
  def initialize
    @board = []
    @feedback = []
    @code = []
    @guess = []
    @round = 0
    @difficulty = 12
    @pegs = []
    @player = 2
  end
  
  def code_maker?
    puts 'Type [1] to be the ' + 'CODE-MAKER'.yellow + ', [2] to be the ' + 'CODE-BREAKER'.blue
    a = gets.chomp.to_i
    @player = a if a == 1
  end

  def user_input
    @input = gets.chomp
    if @input.to_i > 1110 && @input.to_i < 6667
      @input
    else
      puts 'Invalid entry, choose 4 numbers between 1 and 6'
      user_input
    end
  end

  def difficulty
    puts 'Select number of guesses: 16 for '+ 'easy'.blue+', 12 for ' +'normal'.green+', 8 for ' +'hard'.red
    @difficulty = gets.chomp.to_i
  end

  def guess
    puts 'Enter your guess: '
    user_input
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
    @code = @input.chars
    @input = nil
  end

  def set_code
    puts 'Enter the code: '
    user_input
    clear_screen
    @code = @input.chars
    @input = nil
  end

  def show_choices
    puts "Choose 4 of the following: " << "\u278a".red << ' ' << "\u278b".green << ' ' << "\u278c".yellow<< ' ' << "\u278d".blue<< ' ' << "\u278e".pink << ' ' << "\u278f".gray
  end

  def feedback
    @feedback[@round] = Player.feedback(@code, @guess[@round])
  end

  def print_board
    clear_screen
    show_choices
    (0..@round).each do |i|
      puts "#{@pegs[i]} | #{@feedback[i]}"
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
      puts 'Congrats, you broke the code!'
    else
      puts "On no, you lost, the code was #{Player.input(@code.join)}"
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
    reset_game if gets.chomp.upcase == 'Y'
  end

  def start
    Greetings.say_hi
    difficulty
    code
    play
    game_end
    reset
  end

  def reset_game
    @board = []
    @feedback = []
    @code = []
    @guess = []
    @round = 0
    @difficulty = 12
    @pegs = []
    @player = 2
    clear_screen
    start
  end
end
