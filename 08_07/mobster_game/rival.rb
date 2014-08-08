class Rival
  attr_reader :level, :money, :territory, :rival_turf, :fightable

  def initialize(level=(rand(1..10)), rival_turf=nil)
    @level = level
    @money = level * 10
    @rival_turf = rival_turf
    @fightable = true
  end

  def pay_territory(player)
    if @rival_turf != nil
      player.turf.push(@rival_turf)
    else
      puts "Rival has no turf"
    end
  end
end



  #create RivalBoss that inherits from Rival
