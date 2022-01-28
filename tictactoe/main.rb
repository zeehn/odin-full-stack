require_relative 'game'

print "\nChoose a username for Player-1: "
user_one = gets.chomp

print "\nChoose a username for Player-2: "
user_two = gets.chomp

player1 = Player.new(user_one, 'x')
player2 = Player.new(user_two, '#')

game = Game.new
game.add_player(player1)
game.add_player(player2)
game.display_board
game.play 


