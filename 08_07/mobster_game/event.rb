require "./mobster_script.rb"

class Event
  attr_reader :options
  attr_accessor :game

  def initialize
    @options = []
  end
end

class Rival_Crossing < Event
  def initialize
    @options = ['ignore', 'fight', 'help', 'exit']
    @rival = Rival.new

    puts "A new rival has crossed into your territory."
    puts "You can fight him for a chance to earn respect and money, or you can ignore him."
    puts "Your options are #{@options}. What would you like to do?"
    @action = gets.chomp.downcase
  end
end

crossing = Rival_Crossing.new
