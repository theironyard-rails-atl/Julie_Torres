require "./mixins.rb"
require "./mobster.rb"
require "./business.rb"
require "./rival.rb"

#TODO: create a Game class, and dump all this into it
#TODO: add additional business names
#TODO: create weapons to be purchased with money
#TODO: display help
#TODO: create pay_tribute method in Fightable module to distinguish between boss & end boss tribute

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
    #collection extortion $$ from all businesses in your territory
    puts "You collect"
    @mobster.turf.each do |biz|
      @mobster.collect(biz)
    end
  elsif @action == "hussle"
    #earn a random amount of money
    puts "You earn a little money with your regular hussle."
    puts "The cops know what you're up to, but they don't waste time on petty thugs."
    @mobster.earn_money(rand(30..40))
  elsif @action == "shmooze"
    #increase respect by talking to other mobsters
    puts "Other mobsters can't respect you if they don't know who you are."
    puts "You hang out at the bar, shmoozing with the made men."
    @mobster.earn_respect(rand(1..10))
  elsif @action.include? ("lay" || "low")
    #lose heat (and some respect) by laying low
    puts "You lay low for a while, tired of seeing your mug on Wanted posters."
    puts "Who cares what your crew says? You know what prison food tastes like, and you're NOT going back to that."
    @mobster.lay_low
  else
    puts "That is not a valid action. Your options are #{@options}."
    @action = gets.chomp.downcase
    everyday_action
  end
end

def raid
  #get arrested if heat is more than 10x your level
  puts "It's a raid!!!"
  if @mobster.arrested?
    puts "The cops spy you hiding in the corner, and haul you off to jail."
    @mobster.be_jailbird
  elsif @mobster.wanted?
    puts "You sneak out the back door, just as the cops barge in."
    puts "That was a close call! Better lay low--next time you might not be so lucky."
  else
    puts "The cops throw you up against the wall and compare your face against the Wanted posters."
    puts "You laugh, knowing they've got nothing on you."
  end
end

def boss_visit
  puts "The boss comes by to check out your operation."
  @mobster.level_check
  if @mobster.level_up >= 1
    puts "The boss is impressed with your work."
    puts "You've leveled up. You are now level #{@mobster.level}."
    puts "(When you level up, your respect is reset to zero.)"
    @mobster.level_up = 0
    @mobster.respect = 0
  else
    puts "The boss catches you slacking off."
    puts "You give him a little gift to keep him off your back."
    @mobster.money -= 100
  end
end

def end_boss
  @options = ['pay', 'kill', 'help', 'exit']
  @end_boss = Rival_End_Boss.new(10, "California")

  puts "The END Boss appears and challenges you for your turf."
  puts "If you are powerful enough, you can try to kill him. Otherwise, you must pay up."
  puts "Your options are #{@options}. What would you like to do?"
  @action = gets.chomp.downcase
  respond_to_end_boss
end

def respond_to_end_boss
  if @action == "help"
    puts "Help page"
    #TODO: display help
  elsif @action == "exit"
    exit
  elsif @action == "kill"
    @mobster.fight_to_death(@end_boss)
  elsif @action == "pay"
    @mobster.turf = []
    puts "You turn over all your territories to the END Boss, and live to fight another day."
  else
    puts "That is not a valid action. Your options are #{@options}."
    @action = gets.chomp.downcase
    respond_to_rival
  end
end


#Game continues generating events until user chooses to exit, or until 20 or 50 rounds have passed
def action_loop
  until @action == "exit" || (@round % 20) == 0 ||  (@round % 50 == 0)
    @round += 1 unless (@round % 20) == 0 ||  (@round % 50 == 0)
    puts "It is day #{@round}"
    event = rand(1..10)
    case event
    when (1..2)
      new_rival
    when (3..4)
      new_business
    when 5
      raid
    when 6
      boss_visit
    when (7..10)
      ordinary_day
    else
      raise "Event not generated"
    end
    puts "___" * 30
    @mobster.get_stats
    puts "Press enter to end day."
    gets.chomp   #requires player to press enter to continue
    puts "===" * 30
    puts "===" * 30
  end
end

# @round = 49  #This line for testing End Boss
create_mobster
begin_game
action_loop

if @round % 50 == 0
  @round += 1
  puts "It is day #{@round}"
  puts "!!!!!!!End Boss Appears!!!!!!"
  end_boss
else
  @round += 1
  puts "It is day #{@round}"
  puts "Rival Boss Appears"
  new_boss
end

action_loop
