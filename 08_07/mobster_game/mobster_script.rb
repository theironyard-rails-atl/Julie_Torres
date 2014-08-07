require "./mobster_game.rb"
require "./mobster.rb"
require "./business.rb"

bud = Mobster.new
shop = Business.new
bud.extort(shop)
puts "You have $#{bud.money}, #{bud.heat} heat, #{bud.respect} respect, and are level #{bud.level}."
bud.extort(shop)
puts "You have $#{bud.money}, #{bud.heat} heat, #{bud.respect} respect, and are level #{bud.level}."
