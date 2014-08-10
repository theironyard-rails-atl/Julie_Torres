require "./mixins.rb"
require "./mobster.rb"
require "./business.rb"
require "./rival.rb"


puts "What is your mobster's name?"
name = gets.chomp
mobster= Mobster.new(name)

puts "Welcome, #{name}!"
puts "Type 'help' to read the instructions, or 'start' to play."
action = gets.chomp.downcase

if action == help
  puts "Instructions go here."
  #TODO: create help method and page.
elsif action == start
  puts "Beginning game."
  mobster.get_stats
else
  puts "That is not a valid option. Enter 'help' or 'start'."
  action = gets.chomp.downcase
  redo #TODO: make sure this works
  #TODO: create random action method
end

until action == "exit"
  event = rand(1..10).to_i
  case event
  when 1
    @current_event = Rival_Crossing.new
    action = gets.chomp.downcase
    @current_event.respond(action)
  when 2
end
