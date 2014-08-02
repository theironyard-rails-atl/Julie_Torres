require 'pry'

#Suits have been excluded because they do not affect gameplay.

arr = (2..10).to_a << :A, :J, :Q, :K
CARDS = arr.flatten!
DECK = CARDS.concat(CARDS).concat(CARDS)
#puts "Length = #{DECK.length}"
#puts "#{DECK}"

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

class Deck
  attr_reader :deck, :drawn
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
    @drawn << @deck.pop
  end



end

# test_deck = Deck.new
# #puts test_deck.count
# test_deck.draw
# test_deck.draw
# test_deck.draw
# puts test_deck.count_drawn
# test_card = Card.new(:K)
# puts test_card
# puts test_card.value
