require "./mixins.rb"
require "pry"

class Mobster
  include Arrestable
  include Respectable
  include Cashable
  include Fightable
  attr_accessor :respect, :level, :money, :heat, :turf, :fights_won, :bosses_killed, :kill_count, :level_up

  def initialize(name)
    @name = name
    @money = 0
    @respect = 0
    @heat = 0
    @level = 1
    @turf = []
    @fights_won = 0
    @bosses_killed = 0
    @kill_count = 0
  end

  def level_check
    if @level < 5
      @level_up = (@respect / 20).to_i
      # binding.pry
    elsif @level < 10
      @level_up = (@respect / 100).to_i
    elsif @level < 50
      @level_up = (@respect / 500).to_i
    else
      @level_up = (respect / 1000).to_i
    end
    @level += @level_up
  end

  def get_stats
    puts "You have $#{@money}, #{@heat} heat, #{@respect} respect, and are level #{@level}."
    puts "You have #{@turf.count} territories: #{@turf}"  #TODO: make this output only the name of business
  end

  def lay_low
    @heat -= 10
    @respect -=5
  end

  def extort(business)
    @turf.push business
    self.collect(business)
    heat = rand(business.level.to_i * 3).to_i
    @heat += heat
  end

  def collect(business)
    level = business.level.to_i
    money = 5 * level
    @money += money
    puts "You collect $#{money} from #{business.name}"
  end


  def add_territory(territory)
    @turf.push(territory)
  end

  def die
    puts "You die a horrible, grizzly death. Fear not--your death will be avenged."
    exit
  end

  def win_game
    puts "You defeated the Top Boss. You are the most feared mobster in the nation. You win!"
    puts "Here are your ending stats:"
    mobster.get_stats
    exit
  end
end
