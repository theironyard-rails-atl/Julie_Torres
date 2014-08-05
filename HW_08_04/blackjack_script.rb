require './blackjack'

bobby = Player.new("Bobby_Boy")
dealer = Dealer.new

puts "Starting game."
puts "How much would you like to bet?"
bet = gets.chomp.to_i

dealer.deal(bobby)
dealer.deal_to_self

puts "Dealer is showing #{dealer.hand.hand[0]}"

def prompt(player)
  puts "Your hand is #{player.hand.to_s}."
  puts "Would you like to hit or stand?"
  gets.chomp.downcase
end

action = prompt(bobby)

until action == "stand"
  dealer.hit(bobby)
  action = prompt(bobby)
end

while dealer.dealer_hit?
  dealer.hit(dealer)
end

puts "Game over."
puts "Dealer's hand is #{dealer.hand}, with a value of #{dealer.hand.get_value}"
puts "#{bobby.name}'s hand is #{bobby.hand}, with a value of #{bobby.hand.get_value}"

if bobby.busted?
  puts "You lose!"
  bobby.lose(bet)
elsif dealer.busted?
  puts "You win!"
  bobby.win_money(bet)
elsif bobby.hand.get_value > dealer.hand.get_value
  puts "You win!"
  bobby.win_money(bet)
else
  puts "You  lose!"
  bobby.lose(bet)
end

puts "You leave with #{bobby.money}"
