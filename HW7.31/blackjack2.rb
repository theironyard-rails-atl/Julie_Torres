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
    @blackjack = false
    @bust = false
  end



  def add(*new_card, card_value)
    @card_value = card_value.to_i
    if @hand_value <= 21
        @hand_value
    elsif @hand_value > 21 && @hand.include?(:A)
        until @hand <= 21
          @hand.each do |card|
            if card == :A
              @hand_value -= 10
            else
              @hand_value
            end
        end
    elsif @hand_value == 21
      @blackjack = true
    elsif @hand_value > 21
      @bust = true
    else
      raise "Hand value not computed correctly"
    end
  end
end






card = Card.new(4)
card2 = Card.new(:K)
card_value = card.value
card2_value = card2.value
test_hand = Hand.new()
test_hand.add(card, card_value)
test_hand.add(card2, card2_value)
puts test_hand.hand_value
