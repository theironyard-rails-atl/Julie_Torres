require "./mobster_game.rb"
require "./mobster.rb"
require "./business.rb"
require "./rival.rb"

bud = Mobster.new
shop = Business.new
rival = Rival.new(5, "Burt's Cafe")
bud.extort(shop)
puts "You have $#{bud.money}, #{bud.heat} heat, #{bud.respect} respect, and are level #{bud.level}."
bud.extort(shop)
puts "You have $#{bud.money}, #{bud.heat} heat, #{bud.respect} respect, and are level #{bud.level}."
