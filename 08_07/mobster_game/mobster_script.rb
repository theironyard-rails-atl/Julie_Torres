require "./mobster_game.rb"
require "./mobster.rb"
require "./business.rb"
require "./rival.rb"

bud = Mobster.new
shop = Business.new
rival = Rival.new(1, "Burt's Cafe")
bud.extort(shop)
bud.get_stats
bud.extort(shop)
bud.get_stats
bud.earn_money(5)
bud.get_stats
bud.earn_respect(2)
bud.get_stats
bud.lose_money(2)
bud.lose_respect(1)
bud.get_stats
bud.level_up
bud.get_stats
bud.fight(rival)
bud.get_stats
