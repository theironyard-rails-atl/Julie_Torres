require 'pry'

CARDS = (2..10).to_a << :A, :J, :Q, :K


class Card
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

   def value
     if (2..9).include? @cards
         @cards
     elsif [10, :J, :Q, :K].include? @cards
         10
     elsif @cards == :A
         1
    else
      raise "Card value is invalid"
     end
   end
end

test_card = Card.new(:K)
puts test_card
puts test_card.value
