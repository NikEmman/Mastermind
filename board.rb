# U+26AA,u26ac u25cf possible red/white dots

# U+278A-F possible peg
require_relative 'colors'
require 'pry-byebug'


class Board
   attr_accessor  :guess 
    def initialize
        @peg1 = " " + "\u278a".red
        @peg2 = " " + "\u278b".green
        @peg3 = " " + "\u278c".yellow
        @peg4 = " " + "\u278d".blue
        @peg5 = " " + "\u278e".pink
        @peg6 = " " + "\u278f".gray
        @latest_guess = ""
        @feedback = ""
        @potition_hit = " "+"\u25cf".red
        @color_hit =" " + "\u26ac"   
        @board = "#{@latest_guess}    #{@feedback}"
        @guess
        @input
        @code
    end
    def add_position_hit
        @feedback << @potition_hit
    end
    def add_color_hit
        @feedback << @color_hit
    end

    def user_input
      @input = gets.chomp
      @input.chars.each do 
        |a| case a
            when "1"
                @latest_guess << @peg1
            when "2"
                @latest_guess << @peg2
            when "3"
                @latest_guess << @peg3
            when "4"
                @latest_guess << @peg4
            when "5"
                @latest_guess << @peg5
            when "6"
                @latest_guess << @peg6
            end
        end
    end  

    def user_guess
        puts "Enter your next guess: "
        user_input
        @guess = @input.chars
    end

    def master_code
        puts "Enter the code:"
        user_input
        @code = @input.chars
    end

    def show
       puts @peg1 + @peg2 + @peg3 + @peg5 + @peg6 + @peg4
    end
    
    def display_board
        @board = "#{@latest_guess}    #{@feedback}"
        puts @board
    end
end


