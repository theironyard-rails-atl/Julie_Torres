require "./mobster_game.rb"

class Mobster
  include Arrestable
  attr_accessor :respect, :level, :money, :heat

  def initialize
    @money = 0
    @respect = 0
    @heat = 0
    @level = 1
    @turf = []
  end

  def lay_low
    @heat -= 10
    @respect -=5
  end

  def extort(business)
    heat = rand(0..business.level.to_i)
    money = 5 * (rand(1..business.level.to_i))
    @heat += heat
    @money += money
    #make business.extorted_by == mobster, and allow collect method, add business to "territory" array
    puts "You took on #{heat} heat and earned $#{money}"
  end

  def earn_money(money)
    @money += money.to_i
  end

  def earn_respect(respect)
    @respect += respect.to_i
  end

  def add_territory(territory)
    @turf.push(territory)
  end

  def fight(rival)
    damage = rival.level.to_i * rand(8)
    hits = self.level * rand(10)
    if damage < hits
      puts "You win!"
      self.win_fight
      #win money
      #win respect
      #win businesses to extort from
    elsif damage > hits
      puts "You wake up in the hospital, penniless and bruised."
      self.lose_fight
      #lose money
      #lose respect
      #lose one extorted territory
    else
      puts "You beat each other senseless.\n
      Finally you\'re both in so much pain that no one dares throw another punch.\n
      Both of you leave with your respect and your money still intact.\n
      You have $#{@money}, #{@respect} respect, #{@heat} heat and are level #{@level}."
    end
  end

    def win_fight
      self.earn_money(rival.money) #TODO: check and make sure this method knows who rival is
      self.earn_respect(rival.level.to_i * 5) #TODO: make sure this works
    end
end
