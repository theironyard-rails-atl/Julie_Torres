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

class Person
  attr_accessor :hand
  attr_reader :name

  def initialize(name="Guest" + "#{rand(10)}")
    @name = name
    @hand = Hand.new
  end

  def hand
    @hand = Hand.new
  end

  def get_score
    hand.get_value
  end

  def busted?
    hand.busted?
  end

  def blackjack?
    hand.blackjack?
  end
end


class Player > Person
  attr_accessor :money
  def initialize(money= 100)
    @money = money
    super
  end

  def in_game?
    @money > 0
  end

  def win_money(bet, odds=1)
    self.money = self.money += bet * odds
  end

  def lose(bet)
    self.money = self.money -= bet
  end
end

def Dealer > Person
  attr_accessor :deck
  def initialize
    super
    @deck = Deck.new
  end

  def reshuffle
    #in below line, deck is a method, not a variable
    #the attr_accessor turns it into a method
    deck.reshuffle
  end

  #TODO: add deal, hit, and dealer_hit? methods
end
