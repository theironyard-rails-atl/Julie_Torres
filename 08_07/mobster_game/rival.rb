class Rival
  attr_reader :level, :money, :territory
  attr_accessor :fightable, :alive, :rival_turf

  def initialize(level=(rand(1..9)))
    @level = level.to_i
    @money = @level * 10
    @fightable = true
    @alive = true
  end
end

class Rival_Boss < Rival
  #Rival boss has territory.
  attr_reader :rival_turf
  def initialize(level=10, rival_turf=nil)
    super(rival_turf)
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

class Rival_End_Boss < Rival_Boss
  def fightable?(mobster)
    if mobster.bosses_killed >= 3 && mobster.respect >= 1000
      @fightable = true
    else
      puts "The End Boss laughs at your challenge. You are beneath him."
      puts "You must kill at least 3 bosses and gain at least 1000 respect to fight the End Boss."
    end
  end
end





  #create RivalBoss that inherits from Rival
