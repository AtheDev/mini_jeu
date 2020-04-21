require_relative 'player'

class Game

  attr_accessor :human_player, :enemies


  def initialize(user_name)
    @human_player = HumanPlayer.new(user_name)
    @enemies = []
    player1 = Player.new("Josiane")
      @enemies << player1
    player2 = Player.new("José")
      @enemies << player2
    player3 = Player.new("Antoinette")
      @enemies << player3
    player4 = Player.new("Bob")
      @enemies << player4
  end

  def kill_player(index)
    @enemies.delete(index)
  end

  def is_still_ongoing?
    if @enemies.length > 0 && @human_player.life_point > 0
      return true
    else
      return false
    end
  end

  def show_players
    puts @human_player.show_state
    puts "Il reste #{@enemies.length} ennemis à combattre."
  end

  def menu
    puts ">>>>   Quelle action veux-tu effectuer?   <<<<"
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner"
    puts " "
    puts "attaquer un joueur en vue:" if @enemies.length > 0
    i = 0
    @enemies.each do |enemie|
      if enemie.life_point > 0
        print "#{i} - "
        print enemie.show_state
        i += 1
      end
    end

  end

  def menu_choice(action)
    if action == "a"
      @human_player.search_weapon
    elsif action == "s"
      @human_player.seach_health_pack

    elsif (action.to_i < @enemies.size && action.match(/[0-9]/))
      index = action.to_i
      @human_player.attacks(@enemies[index])
        if @enemies[index].life_point <= 0
          kill_player(@enemies[index])
        end
    else
      puts "ATTENTION => choisissez une action parmis la liste."
      menu
      action = gets.chomp
      menu_choice(action)
    end

  end

  def enemies_attack
    if @enemies.length > 0
      puts "Les autres joueurs attaquent!!"
      @enemies.each do |enemie|
        enemie.attacks(@human_player) if enemie.life_point > 0
        gets.chomp
        puts "\n"
      end
    else
      puts "Plus de joueur pour attaquer."
    end
  end


  def end
    if @human_player.life_point > 0 && @enemies.each {|enemie|enemie.life_point = 0}
      puts "BRAVO! TU AS GAGNE!"
    else
      puts "Loser! Tu as perdu!"
    end
  end

end