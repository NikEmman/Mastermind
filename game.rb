require_relative 'player'
require 'pry-byebug'

# This is my Game class, rubycop stop pestering me
class Game
  attr_accessor :board, :round
  def initialize
    @board = []
    @feedback = []
    @code = []
    @guess = []
    @round = 0
    @difficulty = 12
    @pegs = []
  end

  def user_input
    @input = gets.chomp
    # missing validation
  end

  # def difficulty
  #   puts "Select number of guesses: 16 for easy, 12 for normal, 8 for hard"
  #   @difficulty = gets.chomp.to_i
  # end

  def guess
    puts 'Enter your guess: '
    user_input
    @pegs[@round] = Player.input(@input)
    @guess[@round] = @input.chars
    @input = nil
  end

  def code
    puts 'Enter the code: '
    user_input
    system("clear")
    system ("cls")
    @code = @input.chars
    @input = nil
  end

  def feedback
    @feedback[@round] = Player.feedback(@code, @guess[@round])
  end

  def print_board
    (0..@round).each do |i|
      puts "#{@pegs[i]} | #{@feedback[i]}"
    end
  end

  def start 
    # difficulty
    code
    until (win? || end?) do
    guess
    feedback
    print_board
    @round += 1
    end
    if win?
       puts " Congrats, you broke the code!" 
    else 
      puts "On no, you lost"
    end
  end

  def end?
    if @round == @difficulty
      true
    end
  end

  def win?
    if @guess[@round -1] == @code
      true
    end
  end
end

a= Game.new
a.start
