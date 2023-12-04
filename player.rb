require_relative 'colors'
require 'pry-byebug'
# Add computer code choice
class Player
  @@peg1 = ' ' << "\u278a".red
  @@peg2 = ' ' << "\u278b".green
  @@peg3 = ' ' << "\u278c".yellow
  @@peg4 = ' ' << "\u278d".blue
  @@peg5 = ' ' << "\u278e".pink
  @@peg6 = ' ' << "\u278f".gray
  @@position_hit = "\u25cf".red
  @@color_hit = "\u26ac"

  def self.input(input)
    latest_guess = ""
    input.chars.each do |a|
      case a
      when '1'
        latest_guess << @@peg1
      when '2'
        latest_guess << @@peg2
      when '3'
        latest_guess << @@peg3
      when '4'
        latest_guess << @@peg4
      when '5'
        latest_guess << @@peg5
      when '6'
        latest_guess << @@peg6
      end
    end
    latest_guess
  end

  def self.create_code
    4.times.map{rand(1..6)}.join
  end

  def self.feedback(code, guess)
    feedback = ''
    guess_copy = guess.dup
    code.each_with_index do |b, i|
      if guess_copy[i] == b
        feedback << @@position_hit
        guess_copy[i] = nil
      end
    end
    guess_copy.uniq.each do |a|
      feedback << @@color_hit if code.include?(a)
    end
    feedback
  end
  
  def self.peg(int)
    peg_arr = [@@peg1,@@peg2,@@peg3,@@peg4,@@peg5,@@peg6,@@position_hit,@@color_hit]
    peg_arr[int-1]
  end

  def self.display_choice
    @@peg1 << @@peg2 << @@peg3 << @@peg4 << @@peg5 << @@peg6
  end
end
