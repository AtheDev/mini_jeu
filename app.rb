require 'bundler'
Bundler.require

#require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Josiane")
player2 = Player.new("José")

while player1.life_point > 0 && player2.life_point > 0
  puts "\n\n"
  puts "Voici l'état de chaque joueur: "
  puts "#{player1.show_state} \n #{player2.show_state}"
  puts ">>>>   Passons à la phase d'attaque   <<<<\n\n"
  player1.attacks(player2)
    if player2.life_point <= 0
      break
    end
  puts "\n"
  player2.attacks(player1)
end
