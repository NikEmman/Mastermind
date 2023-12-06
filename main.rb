require_relative 'game'

# ask for who puts code and who breaks it (human and "AI")

# BUG_LIST

# wrong feedback, code = 5212  , guess = 5211, try #uniq before guess_copy[i] = nil

# at difficulty prompt do a validation like is_int? or w/e

# refactor Game, start method should be in main and call a.help?,a.difficulty etc

#at the end check for pry-byebugs and redundant methods/variables
class Main
    @@new_game = Game.new
    def self.start
        @@new_game.start
        reset while @@new_game.reset == true
    end

    def self.reset
        @@new_game.clear_screen
        @@new_game = Game.new
        @@new_game.start
    end
    
end
Main.start
