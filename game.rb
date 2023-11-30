require_relative 'colors'
require_relative 'player'
require 'pry-byebug'
# This is my Game class, rubycop stop pestering me
class Game
  @board = []
  @latest_guess = ''
  @feedback = ''
  @code
  @guess

  def user_input
    @input = gets.chomp
    # missing validation
  end

  def guess
    puts 'Enter your guess: '
    user_input
    @latest_guess = Player.input(@input)    
    @guess = @input.chars
  end

  def code
    puts 'Enter the code:'
    user_input
    @code = @input.chars
  end

  def add_guess_to_board
    @board.push("#{@latest_guess}    #{@feedback}")
  end

  def feedback
    @feedback = Player.feedback(@code, @guess)
    add_guess_to_board
  end

  def print_board
    feedback
    @board.each {|a| puts a}
  end

  def start 
   # Player.set_difficulty  #not implemented yet
    code
    binding.pry
    guess
    print_board
  end
end

a= Game.new
a.start
