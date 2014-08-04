require 'pry'

RANKS = (2..10).to_a + [:A, :J, :Q, :K]
SUITS = [:C, :D, :H, :S]


class Card
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank, @suit = rank, suit
  end

#This value method is redundant, but I am keeping it for purposes of passing the spec.
#Best to use the value method in the Hand class.
   def get_value
     if (2..10).include?(@rank)
         @rank
     elsif [:J, :Q, :K].include? @rank
         10
     elsif @rank == :A
         11
     else
        raise "Card value is invalid"
     end
   end

   def to_s
     "#{@rank}#{@suit}"
   end
end


class Deck
  attr_reader :cards, :drawn
  def initialize#optional:include qty of decks
    @cards = [ ]
    @drawn = [ ]
    Card::RANKS.each do |rank|
      Card::SUITS.each do |suit|
        @cards << Card.new(rank, suit)
      end
    end
  end

  def count
    @cards.length
  end

  def count_drawn
    @drawn.length
  end

  def draw
    card = @cards.pop
    @drawn << card
    card
  end


  def reshuffle
    @drawn = [ ]
    @cards += @drawn
    @cards.shuffle!
  end
end

class Hand
  attr_accessor :hand, :hand_value

  def initialize
    @hand = []
    @hand_value = 0
  end

  def add(*new_cards)
    @hand += new_cards
    get_value
  end

  def to_s
    @hand.map { |card| card.to_s}.join(', ')
  end

  def get_value
    @hand_value = 0
    aces = 0
    @hand.each do |card|
      if card.rank != :A
        @hand_value += card.get_value
      else
        @hand_value += card.get_value
        aces += 1
      end

      while @hand_value > 21 && aces > 0
        @hand_value -= 10
        aces -= 1
      end
    end
    @hand_value
  end


  def busted?
    #get_value = calling a method on self (self not req'd)
    get_value > 21
  end

  def blackjack?
    @hand.count == 2 && @hand_value == 21
  end
end

# hand = Hand.new
# hand.add(Card.new(:A, :H))
# hand.add(Card.new(:K, :S))
#
# puts hand.hand
# puts hand.get_value
# puts hand.blackjack?
# puts hand.to_s
