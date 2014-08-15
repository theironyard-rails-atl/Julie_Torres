require 'pry'

#Suits have been excluded because they do not affect gameplay.

arr = (2..10).to_a << :A, :J, :Q, :K  #create array with one of each card--facecards are arrays inside arrays
ITEMS = arr.flatten! #turn it into one big array
DECK = ITEMS.concat(ITEMS).concat(ITEMS) #double the array, the double it again, produces 52 item array
#puts "Length = #{DECK.length}"
#puts "#{DECK}"

class Card #create Card class
  attr_reader :cards, :card_value #make @cards & @card_value readable outside class
  def initialize(cards) #takes in a card (from deck or card specified)
    @cards = cards #turns the card into an instance variable, for use throughout the class
  end

   def value(cards)
     if (2..9).include? @cards
         @card_value = @cards.to_i
     elsif [10, :J, :Q, :K].include? @cards
         @card_value = 10
     elsif @cards == :A
         @card_value = 1
    else
      raise "Card value is invalid"
     end
   end
end

new_card = Card.new((4))
#puts "#{new_card}"
#puts new_card.value

class Deck
  attr_reader :deck, :drawn, :new_card
  def initialize#optional:include qty of decks
    @deck = DECK
    @drawn = [ ]
  end

  def count
    @deck.length
  end

  def count_drawn
    @drawn.length
  end

  def draw
    @new_card = @deck.pop
    @drawn << @new_card
  end
end

class Hand
  attr_reader :cards, :hand_value
  def initialize
    @cards = []
  end

  def add(*new_card)
    @new_card = new_card
    @new_card.each do |new_card|
      @cards << new_card
    end
  end

  def hand_value
    @hand_value = 0
    @cards.each do |card|
      @hand_value += card.value
    end
  end
  @hand_value
end


test_hand = Hand.new
new_hand = test_hand.add(Card.new(4), Card.new(:K))
#puts new_hand
puts "Hand is #{new_hand}"
puts "Hand value is #{new_hand.hand_value}."
# puts @hand_cards
