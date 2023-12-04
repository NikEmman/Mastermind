require_relative 'game'

# g = Game.new

# ask for who puts code and who breaks it (human and "AI")
# g.request_code
# a method to ask for number of guesses or easy(16) / normal(12) / hard(8)
# start a loop
# g.user_guess which includes a method for validation
# a method to check the user_guess vs code and get feedback
# a method to print the board with all the guesses
# finish the loop when number of guesses our out or user_guess==code
# ask for replay

# Maybe write in main.rb first what is my game flow (.i.e get code,
# get user_guess, compare to code, check for round/number of guesses etc)
# and the proceed to write the method/classes as needed

a = Game.new
a.start
