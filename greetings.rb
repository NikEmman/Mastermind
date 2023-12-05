# frozen_string_literal: false

require_relative 'player'
require_relative 'game'
require_relative 'colors'
require 'pry-byebug'
# This class is awsome. To_do : Add help function
class Greetings
  CODE_BREAKER = 'CODE-BREAKER'.blue
  CODE_MAKER = 'CODE-MAKER'.yellow
  WELCOME_TEXT = "Welcome to Mastermind. Start with selecting [1] for the #{CODE_MAKER}, [2] for the #{CODE_BREAKER}

Then choose how many tries the #{CODE_BREAKER} will have. To enter the code or the guess, type

4 digits between 1 and 6 for their corresponding color choice #{Player.peg(1)}#{Player.peg(2)}#{Player.peg(3)}#{Player.peg(4)}#{Player.peg(5)}#{Player.peg(6)}

If you know the rules, press ENTER to play. If you want to learn how to play, type [help]"

  HELP_TEXT = "HOW TO PLAY :

  First the #{CODE_MAKER} chooses a code of 4 digits between 1-6 for their corresponding color choice    #{Player.peg(1)}#{Player.peg(2)}#{Player.peg(3)}#{Player.peg(4)}#{Player.peg(5)}#{Player.peg(6)}

  Then the #{CODE_BREAKER} tries to find the code. She types her own 4 digit code.

  The #{CODE_MAKER} then provides feedback on how close the guess was to the code.

  Given a code of #{Player.peg(1)}#{Player.peg(1)}#{Player.peg(5)}#{Player.peg(6)}

  and a guess of #{Player.peg(4)}#{Player.peg(1)}#{Player.peg(3)}#{Player.peg(5)}

  The feedback recieved is #{Player.peg(7)}#{Player.peg(8)}

  #{Player.peg(7)} for #{Player.peg(1)}  in the second position and #{Player.peg(8)} for #{Player.peg(5)}  which exists in the code

  but at the wrong position

   ------------- PRESS ENTER TO START THE GAME ----------"

def self.say_hi
  clear_screen
  puts WELCOME_TEXT
  help?
end

def self.clear_screen
  system('clear')
  system('cls')
end

def self.help?
  input = gets.chomp
  display_help if input.downcase == 'help'
end

def self.display_help
  clear_screen
  puts HELP_TEXT
  gets
end 
end
