require './player.rb'
require './game.rb'

bob = Player.new("Bob")
ann = Player.new("Ann")

game = Game.new(bob, ann)
game.prompt