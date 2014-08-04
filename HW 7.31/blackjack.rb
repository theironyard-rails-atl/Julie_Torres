require 'pry'

#Suits have been excluded because they do not affect gameplay.

arr = (2..10).to_a << :A, :J, :Q, :K
ITEMS = arr.flatten!
DECK = ITEMS.concat(ITEMS).concat(ITEMS)
#puts "Length = #{DECK.length}"


class Card
  attr_accessor :card_value, :card, :name
  # attr_reader :card

  # def self.create_with_attributes(card, card_value)
  #   card = Card.new(card)
  #   card_value = card.value
  # end

  def initialize(card)
    @card = card  #TODO: change this to @rank
    @card_value = card_value
  end

   def value
     if (2..9).include? @card
         @card
     elsif [10, :J, :Q, :K].include? @card
         10
     elsif @card == :A
         11
    else
      raise "Card value is invalid"
     end
   end

   def to_s
     @card.to_s
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
    @new_card
  end
end

class Hand
  attr_accessor :hand, :new_card, :hand_value

  def initialize
    @hand = []
    @hand_value = 0
  end

  def add(*new_card, card_value)
    @card_value = card_value
    @hand_value += @card_value
    new_card.each do |new_card|
      @hand << new_card
       @hand
    end
  end

  def to_s
    array = []
    @hand.each do |card|
      array << card.to_s
    end
    array.join(', ')
  end

  def ace_adjust
      @hand.each do |card|
        puts "Reducing value of #{card}"
        @hand_value -= 10 if card.card == (:A) && @hand_value >21
      end
  end
end


card = Card.new(4)
card.name
card2 = Card.new(:A)
card3 = Card.new(:A)
card_value = card.value
card2_value = card2.value
card3_value = card3.value
test_hand = Hand.new()
test_hand.add(card, card_value)
test_hand.add(card2, card2_value)
test_hand.add(card3, card3_value)
test_hand.ace_adjust
puts "Hand contains #{test_hand}"
puts test_hand.hand_value
