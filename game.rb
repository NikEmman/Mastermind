require_relative 'board'

class Game
  def initialize
    @board = Board.new
  end

  def start
    @board.user_guess
  end

  def request_code
    puts 'Set the code : '
  end
end

# Should get all the variables in Game class (controller). The board class
# should consist of a method or two then, probably class methods, that take
# arguments (some Game variables?) and then print board or w/e
# Maybe write in main.rb first what is my game flow (.i.e get code,
# get user_guess, compare to code, check for round/number of guesses etc)
# and the proceed to write the method/classes as needed
