module Arrestable
  def wanted?
    @heat > @level * 10
  end

  def arrested?
    self.wanted? == true && rand(3) == 0
  end

  def be_jailbird
    jailtime = @heat - (@heat - (@level * 10))
    if jailtime > 50
      #die in jail
      "You die from old age in jail."
      self.dead? == true
    else
      self.money == 0
      self.respect += jailtime
      self.heat == 0
    end
  end
end

module Respectable
  def earn_respect(respect)
    @respect += respect.to_i
  end

  def lose_respect(respect)
    @respect -= respect.to_i
  end
end

module Cashable
  def earn_money(money)
    @money += money.to_i
  end

  def lose_money(money)
    @money -= money.to_i
  end
end

module Fightable

  def fight(rival)
    damage = rival.level.to_i * rand(8)
    hits = self.level * rand(10)

    if rival.fightable == false
      puts "Dead rivals cannot be fought, but feel free to take out your anger on the corpse."
    elsif damage < hits
      self.win_fight(rival)
    elsif damage > hits
      self.lose_fight(rival)
    else
      self.tie_fight(rival)
    end
  end

  def win_fight(rival)
    puts "You win!"
    self.earn_money(rival.money)
    self.earn_respect(rival.level.to_i * 2)
    rival.pay_territory(self)
    rival.fightable == false
  end

  def lose_fight(rival)
    puts "You wake up in the hospital, penniless and bruised."
    #lose all money
    self.lose_money(@money)
    #lose respect (1 pt per level of advantage, 1 pt min)
    if @level > rival.level.to_i
      self.lose_respect(@level - rival.level.to_i)
    else
      self.lose_respect(1)
    end
    #lose one extorted territory
    @turf.pop
  end

  def tie_fight(rival)
    puts "You beat each other senseless.\n"
    puts "Finally you\'re both in so much pain that no one dares throw another punch.\n"
    puts "Both of you leave with your respect and your money still intact.\n"
  end
end
