class Rival
  attr_reader :level, :money, :territory
  attr_accessor :fightable, :alive

  def initialize(level=(rand(1..9)))
    @level = level
    @money = level * 10
    @fightable = true
    @alive = true
  end
end

class Rival_Boss < Rival
  #Rival boss has territory.
  attr_reader :rival_turf
  def initialize(level=10, rival_turf=nil)
    super
    @fightable = false
    @money = 1000
    @rival_turf = rival_turf
  end

  def pay_territory(mobster)
    if @rival_turf != nil
      mobster.turf.push(@rival_turf)
    else
      puts "Rival Boss has no turf!"
    end
  end

  def fightable?(mobster)
    if mobster.level >= 10 && mobster.fights_won >= 5
      @fightable = true
    end
  end
end
  #def --get multiple territories, get massive respect, get soldiers





  #create RivalBoss that inherits from Rival
