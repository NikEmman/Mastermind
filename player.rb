require_relative 'colors'

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
    position_hits = 0
    color_hits = 0
    guess_copy = guess.dup
    code_copy = code.dup
  
    # First pass to check for position hits
    guess_copy.each_with_index do |guess_peg, index|
      if guess_peg == code_copy[index]
        position_hits += 1
        guess_copy[index] = nil
        code_copy[index] = nil
      end
    end
  
    # Second pass to check for color hits
    guess_copy.compact.each do |guess_peg|
      if code_copy.compact.include?(guess_peg)
        color_hits += 1
        code_copy[code_copy.index(guess_peg)] = nil
      end
    end
  
    # create feedback string
    feedback << @@position_hit * position_hits
    feedback << @@color_hit * color_hits
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
