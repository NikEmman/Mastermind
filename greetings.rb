# frozen_string_literal: false

require_relative 'player'
# This class is awsome. To_do : Add help function
class Greetings
  PEGS = Player.display_choice

  def say_hi
    puts 'Welcome to Mastermind. In order to play start with selecting who will set the code and who will attempt
to break it.'
    puts ''
    puts "Then choose how mane tries the code_braker will have. To enter the code or the guess type
4 digits between 1 and 6 for their corresponding color choice #{PEGS}"
    puts ''
    puts 'If you know the rules, push ENTER. If you want to learn how to play, type [help]'
  end

  def help?
    input = gets.chomp
    display_help if input.downcase == 'help'
  end

  def display_help
    # diplay helpful stuff
  end
end


a = Greetings.new
a.say_hi
