require 'pry'

#Suits have been excluded because they do not affect gameplay.

arr = (2..10).to_a << :A, :J, :Q, :K
CARDS = arr.flatten!
DECK = CARDS.concat(CARDS).concat(CARDS)
#puts "Length = #{DECK.length}"
#puts "#{DECK}"

class Card
  attr_reader :cards, :card_value
  def initialize(cards)
    @cards = cards
  end

   def value
     if (2..9).include? @cards
         @card_value = @cards
     elsif [10, :J, :Q, :K].include? @cards
         @card_value = 10
     elsif @cards == :A
         @card_value = 1
    else
      raise "Card value is invalid"
     end
   end
end

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
  attr_reader :hand, :new_card, :hand_value
  def initialize
    @hand = []
    @hand_value = 0
  end
binding.pry  #@hand & @hand_value = nil. Why??
  def add(new_card)
    @hand << @new_card
    @hand_value += @card_value
  end
end


test_deck = Deck.new
test_deck.draw
test_hand = Hand.new()
test_hand.add(Card.new(4))
puts test_hand.hand
