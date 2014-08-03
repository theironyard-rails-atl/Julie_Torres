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

# new_card = Card.new((:K))
# puts new_card.card
# puts new_card.value

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
  attr_accessor :hand, :new_card, :hand_value

  def initialize(hand=[], hand_value=0)
    @hand = hand
    @hand_value = hand_value
  end

  def add(*new_card, card_value)
    @card_value = card_value.to_i
    puts "Card value is#{@card_value}"

      @hand_value += @card_value
      puts "Hand value is #{@hand_value}"

    new_card.each do |new_card|
      @hand << new_card
    end
  end
end



card = Card.new(4)
card2 = Card.new(5)
card_value = card.value
card2_value = card2.value
test_hand = Hand.new()
new_hand = test_hand.add(card, card_value)
newer_hand = new_hand.add(card2, card2_value)
