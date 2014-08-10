require "./mixins.rb"
require "./mobster.rb"
require "./business.rb"
require "./rival.rb"


#TODO: create a Game class, and dump all this into it
#TODO: make the ouput prettier by putsing a ____ line aft

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

def new_rival
  @options = ['ignore', 'fight', 'kill', 'help', 'exit']
  @rival = Rival.new

  puts "A new rival has crossed into your territory."
  puts "You can fight him for a chance to earn respect and money, or you can ignore him."
  puts "Your options are #{@options}. What would you like to do?"
  @action = gets.chomp.downcase
  respond_to_rival
end

def respond_to_rival
  if @action == "help"
    puts "Help page"
    #TODO: display help
  elsif @action == "exit"
    exit
  elsif @action == "fight"
    @mobster.fight(@rival)
  elsif @action == "kill"
    @mobster.fight_to_death(@rival)
  elsif @action == "ignore"
    puts "You ignore the rival, and go about your business."
  else
    puts "That is not a valid action. Your options are #{@options}."
    @action = gets.chomp.downcase
    respond_to_rival
  end
end

def new_business
  @options = ['ignore', 'extort', 'help', 'exit']
  @biz = Business.new("Porky's BBQ") #TODO: make this pull in random names from a YAML file

  puts "A new business, #{@biz.name}, has opened up."
  puts "You can extort the business, or leave it alone."
  puts "Your options are #{@options}. What would you like to do?"
  @action = gets.chomp.downcase
  respond_to_business
end

def respond_to_business
  if @action == "help"
    puts "Help page"
    #TODO: display help
  elsif @action == "exit"
    exit
  elsif @action == "extort"
    @mobster.extort(@biz)
  elsif @action == "ignore"
    puts "You ignore the business, and waste the day at the bar."
  else
    puts "That is not a valid action. Your options are #{@options}."
    @action = gets.chomp.downcase
    respond_to_business
  end
end

def new_boss
  @options = ['pay', 'kill', 'help', 'exit']
  @boss = Rival_Boss.new(10, "Windy City") #TODO: make this pull in random names from a YAML file

  puts "A rival boss crosses into your territory and demands you give him a cut of your earnings."
  puts "If you are powerful enough, you can try to kill him. Otherwise, you must pay up."
  puts "Your options are #{@options}. What would you like to do?"
  @action = gets.chomp.downcase
  respond_to_boss
end

def respond_to_boss
  if @action == "help"
    puts "Help page"
    #TODO: display help
  elsif @action == "exit"
    exit
  elsif @action == "kill"
    @mobster.fight_to_death(@boss)
  elsif @action == "pay"
    #Pay 10% of your money to the rival boss.
    tribute = (@mobster.money * 0.1).to_i
    @mobster.money -= tribute
    puts "You pay a tribute of $#{tribute}, and live to fight another day."
  else
    puts "That is not a valid action. Your options are #{@options}."
    @action = gets.chomp.downcase
    respond_to_rival
  end
end

def ordinary_day
  @options = ['collect', 'shmooze', 'hussle', 'lay low', 'help', 'exit']

  puts "The neighborhood is quiet."
  puts "It's a good day to make some cash or build your reputation."
  puts "Your options are #{@options}. What would you like to do?"
  @action = gets.chomp.downcase
  everyday_action
end

def everyday_action
  if @action == "help"
    puts "Help page"
    #TODO: display help
  elsif @action == "exit"
    exit
  elsif @action == "collect"
    puts "You collect"
    @mobster.turf.each do |biz|
      @mobster.collect(biz)
    end

    #extort from all businesses in your territory
  elsif @action == "hussle"
    #earn a random amount of money, should be lower than what you get with 3 properties
  elsif @action == "shmooze"
    #increase respect by talking to other mobsters
  elsif @action.include? ("lay" || "low")
    #lay low method
  else
    puts "That is not a valid action. Your options are #{@options}."
    @action = gets.chomp.downcase
    everyday_action
  end
end



create_mobster
begin_game


#TODO: add additional events
until @action == "exit"
  event = rand(1..10).to_i
  case event
  when 11
    new_rival
  when (6..10)
    new_business
  when 31
    new_boss
  when (1..5)
    ordinary_day
  else
    raise "Event not generated"
  end
  puts "___" * 30
  @mobster.get_stats
  #TODO: check to see if mobster will level up
  puts "===" * 30
  puts "===" * 30
end
