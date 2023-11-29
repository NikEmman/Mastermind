require_relative 'board'

class Game 
    def initialize
        @board = Board.new
        @code
        
    end
    def start 
        @board.user_guess

    end
    def get_code
        puts "Set the code : "
    input = gets
    end
end


# Should get all the variables in Game class (controller). The board class
# should consist of a method or two then, probably class methods, that take
# arguments (some Game variables?) and then print board or w/e