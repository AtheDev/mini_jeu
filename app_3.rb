require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

def perform
  #Lancement du jeu
  puts " ________________________________________________ "
  puts " "
  puts "|    Bienvenue sur 'IL VEULENT TOUS MA POO'!!    |"
  puts "| Le but du jeu est d'être le dernier survivant! |"
  puts " ________________________________________________ "
  puts " "
  puts "Quel est ton prénom?"
  name_user = gets.chomp
  my_game = Game.new(name_user)


  #Lancement du combat
  while my_game.is_still_ongoing?
    my_game.show_players
    gets.chomp
    my_game.menu
    action = gets.chomp
    my_game.menu_choice(action)
    gets.chomp
    puts " "
    my_game.enemies_attack
  end

  #Fin du combat
  my_game.end
end


perform