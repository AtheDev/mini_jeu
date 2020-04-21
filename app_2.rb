require 'bundler'
Bundler.require

#require_relative 'lib/game'
require_relative 'lib/player'

puts " ________________________________________________ "
puts " "
puts "|    Bienvenue sur 'IL VEULENT TOUS MA POO'!!    |"
puts "| Le but du jeu est d'être le dernier survivant! |"
puts " ________________________________________________ "
puts " "
puts "Quel est ton prénom?"
name_user = gets.chomp
user = HumanPlayer.new(name_user)

enemies_array = Array.new

player1 = Player.new("Josiane")
enemies_array << player1
player2 = Player.new("José")
enemies_array << player2

while user.life_point > 0 && (player1.life_point > 0 || player2.life_point > 0)
  puts user.show_state
  gets.chomp
  puts " "
  puts ">>>>   Quelle action veux-tu effectuer?   <<<<"
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner"
  puts " "
  puts "attaquer un joueur en vue:"
  print "0 - "
  print "#{player1.show_state}"
  print "1 - "
  puts "#{player2.show_state}"

  action = gets.chomp

  if action == "a"|| action == "s" || action == "0" || action == "1"
  else
    while action != "a" || action != "s" || action != "0" || action != "1"
      puts "choisissez une action parmis la liste."
      action = gets.chomp
      if action == "a"|| action == "s" || action == "0" || action == "1"
        break
      end
    end
  end

  if action == "a"
    user.search_weapon
  elsif action == "s"
    user.search_health_pack
  elsif action == "0" 
    if player1.life_point > 0
      user.attacks(player1)
    else
      puts "Ce joueur est déjà mort. Vous avez perdu un tour d'attaque."
    end
  elsif action == "1"
    if player2.life_point > 0
      user.attacks(player2)
      else
      puts "Ce joueur est déjà mort. Vous avez perdu un tour d'attaque."
    end
  end
  puts " "

  gets.chomp

  if player1.life_point != 0 || player2.life_point != 0
    puts "Les autres joueurs attaquent!!"
    gets.chomp
    puts " "

    enemies_array.each do |enemie|
      if enemie.life_point > 0
        enemie.attacks(user)
        gets.chomp
        puts "\n"
      else
        puts "#{enemie.name} est mort et ne peux plus attaquer."
      end
    end
    puts "\n"
  else
    break
  end

end

if user.life_point > 0 && enemies_array.each {|enemie|enemie.life_point = 0}
  puts "BRAVO! TU AS GAGNE!"
else
  puts "Loser! Tu as perdu!"
end