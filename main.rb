require_relative 'game'

# ask for who puts code and who breaks it (human and "AI")

# BUG_LIST

# wrong feedback, code = 5212  , guess = 5211, try #uniq before guess_copy[i] = nil

# at difficulty prompt do a validation like is_int? or w/e

# refactor Game, start method should be in main and call a.help?,a.difficulty etc

#at the end check for pry-byebugs and redundant methods/variables
a = Game.new
a.start
