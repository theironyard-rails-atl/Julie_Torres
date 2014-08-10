class Event
  attr_reader :options

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

  def respond(action)
    if @action == "help"
      puts "Help page"
      #TODO: display help
    elsif @action == "exit"
      exit
    elsif @action == "fight"
      mobster.fight(@rival)
    elsif @action == "ignore"
      puts "You ignore the rival, and go about your business."
    else
      puts "That is not a valid action. Your options are #{@options}."
      @action = gets.chomp.downcase
    end
end
