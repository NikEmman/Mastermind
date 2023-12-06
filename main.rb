require_relative 'game'

# ask for who puts code and who breaks it (human and "AI")

# BUG_LIST


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
