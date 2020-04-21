class Player

  attr_accessor :name, :life_point, :rand_nb

  def initialize(name_user)
    @name = name_user
    @life_point = 10
  end

  def show_state
    puts "#{@name} a #{life_point} points de vie"
  end

  def gets_damage(number_point)
    @life_point -= number_point
    if @life_point <= 0
      puts "Le joueur #{@name} a été tué!"
      @life_point = 0
    end
  end

  def attacks(player_adv)
    player = player_adv.name
    puts "Le joueur #{@name} attaque le joueur #{player}."

    @rand_nb = compute_damage
    puts "Il lui inflige #{@rand_nb} points de dommages."

    player_adv.gets_damage(@rand_nb)

  end

  def compute_damage
    return rand(1..6)
  end

end

class HumanPlayer < Player

  attr_accessor :weapon_level

  def initialize(name_user)
    @life_point = 100
    @name = name_user
    @weapon_level = 1
  end

  def show_state
    puts "#{@name} a #{life_point} points de vie et une arme de niveau #{@weapon_level}."
  end

  def compute_damage
    return rand(1..6) * @weapon_level
  end

  def search_weapon
    rand_wapon = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{rand_wapon}"
    if rand_wapon > @weapon_level
      @weapon_level = rand_wapon
      puts "Youhou! Elle est meilleure que mon arme actuelle: je la prends."
    else
      puts "M@*#$ ... elle n'est pas mieux que mon arme actuelle: je n'en veux pas."
    end
  end

  def search_health_pack
    rand_health = rand(1..6)

    if rand_health == 1
      puts "Tu n'as rien trouvé..."
    elsif rand_health >= 2 && rand_health <= 5
        if @life_point + 50 > 100
          @life_point = 100
        else
          @life_point = @life_point + 50
        end
      puts "Bravo, tu as trouvé un pack de +50 points de vie!"

    else
      if @life_point + 80 > 100
          @life_point = 100
      else
          @life_point = @life_point + 80
      end
      puts "Waow, tu as trouvé un pack de +80 points de vie!"
    end

  end

end