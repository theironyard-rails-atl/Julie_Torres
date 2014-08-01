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
     elsif @cards == (10 || :J || :Q || :K)
         10
     elsif @cards == :A
         1
    else
      raise "Card value is invalid"
     end
   end
end

test_card = Card.new(4)
puts test_card
puts test_card.value
