class Player
    @@difficulty
    @@peg1 = ' ' << "\u278a".red
    @@peg2 = ' ' << "\u278b".green
    @@peg3 = ' ' << "\u278c".yellow
    @@peg4 = ' ' << "\u278d".blue
    @@peg5 = ' ' << "\u278e".pink
    @@peg6 = ' ' << "\u278f".gray
    @@potition_hit = ' ' << "\u25cf".red
    @@color_hit = ' ' << "\u26ac"
    @@latest_guess = ''
    @@feedback = ''

    def self.set_difficulty
        puts "-----Select the difficulty------"
        puts "Type [1] for Easy(16 guesses), [2] for Normal(12 guesses),
         [3] for Hard(8 guesses)"
        @@difficulty = gets.chomp
        validate_dificulty
    end
    def self.validate_dificulty
        case @@difficulty
        when "1"
            return 16
        when "2"
            return 12
        when "3"
            return 8
        else 
            puts "Wrong input, try again"
            set_difficulty
        end
    end
    def self.input(input)
        input.chars.each do |a|
          case a
          when '1'
            @@latest_guess << @@peg1
          when '2'
            @@latest_guess << @@peg2
          when '3'
            @@latest_guess << @@peg3
          when '4'
            @@latest_guess << @@peg4
          when '5'
            @@latest_guess << @@peg5
          when '6'
            @@latest_guess << @@peg6
          end
        end
        @@latest_guess
      end

      def self.feedback (code, guess)
        code.each do |b|
            for i in guess.length-1
                if guess[i] == b
                    @@feedback << @@potition_hit
                    guess.delete_at[i]
                end
            end
        end
        
        guess.uniq.each do |a| 
            if code.incluce?(a)
                @@feedback << @@color_hit
           end
        end
      end
      @@feedback    
end