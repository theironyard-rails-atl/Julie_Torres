require "./mobster_game.rb"

class Mobster
  include Arrestable
  include Respectable
  include Cashable
  include Fightable
  attr_accessor :respect, :level, :money, :heat, :turf, :alive

  def initialize
    @alive = true
    @money = 0
    @respect = 0
    @heat = 0
    @level = 1
    @turf = []
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
end
  
