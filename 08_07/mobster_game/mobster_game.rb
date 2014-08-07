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
