require "./mixins.rb"
require "./mobster.rb"
require "./business.rb"
require "./rival.rb"






bud = Mobster.new
shop = Business.new("The Rock Farm")
rival = Rival.new(1)
boss = Rival_Boss.new(10, "Los Angeles")
bud.fight_to_death(rival)
bud.get_stats
bud.fight_to_death(boss)
bud.get_stats
