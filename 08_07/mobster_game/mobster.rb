require "./mixins.rb"

class Mobster
  include Arrestable
  include Respectable
  include Cashable
  include Fightable
  attr_accessor :respect, :level, :money, :heat, :turf, :fights_won, :bosses_killed, :kill_count

  def initialize
    @money = 0
    @respect = 0
    @heat = 0
    @level = 1
    @turf = []
    @fights_won = 0
    @bosses_killed = 0
    @kill_count = 0
  end

  def level_up
    "You've leveled up! You are now #{@level}!"
    @level += 1
  end

  def get_stats
    puts "You have $#{@money}, #{@heat} heat, #{@respect} respect, and are level #{@level}."
    puts "You have #{@turf.count} territories: #{@turf}"
  end

  def lay_low
    @heat -= 10
    @respect -=5
  end

  def extort(business)
    level = business.level.to_i
    heat = rand(0..level)
    money = 5 * level
    @heat += heat
    @money += money
    #TODO: make business.extorted_by == mobster, and allow collect method, add business to "territory" array
    puts "You took on #{heat} heat and earned $#{money}"
  end

  def add_territory(territory)
      @turf.push(territory)
  end

  def die
    puts "You die a horrible, grizzly death. Fear not--your death will be avenged."
    exit
  end

  def win_game
    puts "You defeated the Top Boss. You are the most feared mobster in the nation. You win!"
    puts "Here are your ending stats:"
    mobster.get_stats
    exit
  end
end
