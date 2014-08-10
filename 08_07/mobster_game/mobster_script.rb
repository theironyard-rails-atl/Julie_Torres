require "./mixins.rb"
require "./mobster.rb"
require "./business.rb"
require "./rival.rb"
require "./event.rb"

class Game
  attr_accessor :mobster, :game, :current_event

  def create_mobster
    puts "What is your mobster's name?"
    name = gets.chomp
    @mobster= Mobster.new(name)

    puts "Welcome, #{name}!"
    puts "Type 'help' to read the instructions, or 'start' to play."
    @action = gets.chomp.downcase
  end

  def begin_game
    if @action == "help"
      puts "Instructions go here."
      #TODO: create help method and page.
    elsif @action == "start"
      puts "Beginning game."
      @mobster.get_stats
    else
      puts "That is not a valid option. Enter 'help' or 'start'."
      @action = gets.chomp.downcase
      begin_game
      #TODO: make sure this works
    end
  end

  def respond(action)
    if @action == "help"
      puts "Help page"
      #TODO: display help
    elsif @action == "exit"
      exit
    elsif @action == "fight"
      @mobster.fight(@rival)
    elsif @action == "ignore"
      puts "You ignore the rival, and go about your business."
    else
      puts "That is not a valid action. Your options are #{@options}."
      @action = gets.chomp.downcase
      @current_event.respond(@action)
    end
  end
end

@game = Game.new
@game.create_mobster
@game.begin_game

  until @action == "exit"
    event = rand(1..10).to_i
    case event
    when (1..10)
      @current_event = Rival_Crossing.new #TODO: figure out why this isn't working
      @action = gets.chomp.downcase
      @current_event.respond(@action)
    else
      raise "Event not generated"
    end
  end
