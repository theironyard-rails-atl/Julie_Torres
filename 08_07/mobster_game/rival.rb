class Rival
  attr_reader :level, :money, :territory

  initialize(level=rand(10), territory = nil)
    @level = level
    @money = level * 10
    @territory = territory
  end
end




  #create RivalBoss that inherits from Rival
