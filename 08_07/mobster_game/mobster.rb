require "./mobster_game.rb"

class Mobster
  include Arrestable
  include Respectable
  include Cashable
  attr_accessor :respect, :level, :money, :heat

  def initialize
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

  def fight(rival)
    damage = rival.level.to_i * rand(8)
    hits = self.level * rand(10)
    if damage < hits
      puts "You win!"
      #TODO: create win-fight method
      self.earn_money(rival.money)
      self.earn_respect(rival.level.to_i * 2)
      #win money
      #win respect
      #win businesses to extort from
    elsif damage > hits
      #TODO: create lose fight method
      puts "You wake up in the hospital, penniless and bruised."
      #lose all money
      self.lose_money(@money)
      #lose respect (1 pt per level advantage, 1 pt min)
      if @level > rival.level.to_i
        self.lose_respect(@level - rival.level.to_i)
      else
        self.lose_respect(1)
      end
      #lose one extorted territory
      @turf.pop
    else
      #TODO: create tie fight method
      puts "You beat each other senseless.\n
      Finally you\'re both in so much pain that no one dares throw another punch.\n
      Both of you leave with your respect and your money still intact.\n
      You have $#{@money}, #{@respect} respect, #{@heat} heat and are level #{@level}."
    end
  end

    # def win_fight
    #   self.earn_money(rival.money) #TODO: check and make sure this method knows who rival is
    #   self.earn_respect(rival.level.to_i * 5) #TODO: make sure this works
    # end
end
