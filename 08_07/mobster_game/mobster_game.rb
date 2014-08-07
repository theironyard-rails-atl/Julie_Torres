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
