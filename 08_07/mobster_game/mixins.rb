module Arrestable
  def wanted?
    @heat > @level * 10
  end

  def arrested?
    self.wanted? == true && rand(3) == 0
  end

  def be_jailbird
    jailtime = @heat - (@level * 10)
    if jailtime > 50
      #die in jail
      "You die from old age in jail."
      self.dead? == true
    else
      puts "You sit in jail for #{jailtime} years, leaving penniless but with a lot more street cred."
      self.money = 0
      self.respect += jailtime
      self.heat = 0
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
    unless rival.alive == false || rival.fightable == false
      self.get_winner(rival)
    else
      puts "This rival is either dead or is a rival boss."
      puts "Rival bosses can only be fought to death."
    end
  end

  def get_winner(rival)
    damage = rival.level.to_i * rand(8)
    hits = self.level * rand(10)

    if damage < hits
      self.win_fight(rival)
    elsif damage > hits
      self.lose_fight(rival)
    else
      self.tie_fight(rival)
    end
  end

  def win_fight(rival)
    puts "You win!"
    @fights_won += 1
    self.earn_money(rival.money)
    self.earn_respect(rival.level.to_i * 2)
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
  end

  def tie_fight(rival)
    puts "You beat each other senseless.\n"
    puts "Finally you\'re both in so much pain that no one dares throw another punch.\n"
    puts "Both of you leave with your respect and your money still intact.\n"
  end

  def fight_to_death(rival)
    unless rival.alive == false || rival.fightable == false
      self.get_killer(rival)
    else
      puts "You do not have sufficient experience to fight this rival."
      puts "The rival slaps you for your insolence and takes his payment."
      puts "The kids on the street point and laugh, and you lose 10 respect."
      self.lose_respect(10)
      tribute = (self.money.to_i * 0.1).to_i
      self.lose_money(tribute)
    end
  end

  def get_killer(rival)
    damage = rival.level.to_i * rand(8)
    hits = self.level * rand(10)

    if damage < hits
      self.kill_rival(rival)
      rival.fightable = false
    elsif damage > hits
      self.die
    else
      self.tie_fight(rival)
    end
  end

  def kill_rival(rival)
      puts "You kill your rival and take his money. Murderer!"
      self.earn_money(rival.money)
      self.earn_respect(rival.level.to_i * 10)
      @heat += (rival.level.to_i * 3)
      @fights_won += 1
      @kill_count += 1
      rival.fightable == false
      rival.alive == false
  end

  def kill_rival_boss(boss)
    puts "You kill the Rival Boss, taking his turf and gaining control of his gang."
    self.earn_money(1000)
    self.earn_respect(100)
    @heat += (rand(5..30))
    @fights_won += 1
    @kill_count += 1
    @bosses_killed += 1
    boss.pay_territory(self)
    boss.fightable == false
    boss.alive == false
  end
end
