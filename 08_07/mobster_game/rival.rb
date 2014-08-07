class Rival
  attr_reader :level, :money, :territory

  def initialize(level=(rand(1..10)), territory=nil)
    @level = level
    @money = level * 10
    @territory = territory
  end
end

# max = Rival.new
# puts max.level
# puts max.territory


  #create RivalBoss that inherits from Rival
