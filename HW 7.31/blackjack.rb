require 'pry'

#Suits have been excluded because they do not affect gameplay.

arr = (2..10).to_a << :A, :J, :Q, :K
ITEMS = arr.flatten!
DECK = ITEMS.concat(ITEMS).concat(ITEMS)
#puts "Length = #{DECK.length}"


class Card
  attr_accessor :card_value, :card
  # attr_reader :card

  def self.create_with_attributes(card, card_value)
    card = Card.new(card)
    card_value = card.value
    # return card_value
  end

  def initialize(card)
    @card = card
    @card_value = card_value
  end

   def value
     if (2..9).include? @card
         @card
     elsif [10, :J, :Q, :K].include? @card
         10
     elsif @card == :A
         1
    else
      raise "Card value is invalid"
     end
   end
end

new_card = Card.new((:K))
puts new_card.card
puts new_card.value

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
  attr_reader :cards, :new_card, :hand_value, :card_value
  def initialize
    @cards = []
  end

  def add(*new_card)
    new_card.each do |new_card|
      @cards << new_card
      #binding.pry
    end
  end

  def hand_value(*new_card)
    hand_value = 0
    new_card.each do |card|
      hand_value += card.value
      #puts hand_value.to_s
    end
    @hand_value = hand_value

  end
end

#
# test_deck = Deck.new
# test_deck.draw
# test_hand = Hand.new()
# new_hand = test_hand.add(Card.new(4))
# puts new_hand
# test_hand.add(Card.new(:K))
# puts "Hand is #{test_hand.cards.inspect}"
# puts "Hand value is #{test_hand.hand_value}."
# puts @hand_cards
