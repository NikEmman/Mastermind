# frozen_string_literal: false

require_relative 'player'
require_relative 'game'
# This class is awsome. To_do : Add help function
class Greetings

  def self.say_hi
    clear_screen
    puts 'Welcome to Mastermind. Start with selecting [1] for the CODE-MAKER, [2]for the CODE-BREAKER'
    puts ''
    puts "Then choose how many tries the CODE-BREAKER will have. To enter the code or the guess type
4 digits between 1 and 6 for their corresponding color choice #{Player.peg(1)}#{Player.peg(2)}#{Player.peg(3)}#{Player.peg(4)}#{Player.peg(5)}#{Player.peg(6)}"
    puts ''
    puts 'If you know the rules, press ENTER to play. If you want to learn how to play, type [help]'
    help?
    gets
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
    puts "HOW TO PLAY :"
    puts ''
    puts "Player A (hence A) chooses a code of 4 digits between 1-6 for their corresponding color choice    #{Player.peg(1)}#{Player.peg(2)}#{Player.peg(3)}#{Player.peg(4)}#{Player.peg(5)}#{Player.peg(6)}"
    puts ''
    puts "Then Player B (hence B) tries to find the code. B types his own 4 digit code."
    puts ''
    puts 'A then provides feedback on how close the guess was to the code.'
    puts ''
    puts "Given a code of #{Player.peg(1)}#{Player.peg(1)}#{Player.peg(5)}#{Player.peg(6)}"
    puts ' '
    puts "and a guess of #{Player.peg(4)}#{Player.peg(1)}#{Player.peg(3)}#{Player.peg(5)}"
    puts ' '
    puts "The feedback recieved is #{Player.peg(7)}#{Player.peg(8)}"
    puts ' '
    puts "#{Player.peg(7)} for #{Player.peg(1)}  in the second position and #{Player.peg(8)} for #{Player.peg(5)}  which exists in the code"
    puts ' '
    puts 'but at the wrong position'
    puts ' '
    puts ' ------------->PRESS ENTER TO START THE GAME----------'
  end
end
