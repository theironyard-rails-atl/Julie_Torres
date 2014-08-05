require 'pry'

class Card
  RANKS = (2..10).to_a + [:A, :J, :Q, :K]
  SUITS = [:C, :D, :H, :S]

  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank, @suit = rank, suit
  end


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
    @cards.shuffle!
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
    @cards.shuffle!
  end
end

class Hand
  attr_accessor :hand

  def initialize
    @hand = []
  end

  def add(*new_cards)
    @hand += new_cards
    get_value
  end

  def to_s
    @hand.map { |card| card.to_s}.join(', ')
  end

  def get_value
    hand_value = 0
    aces = 0
    @hand.each do |card|
      hand_value += card.get_value
      aces +=1 if card.rank == :A

      while hand_value > 21 && aces > 0
        hand_value -= 10
        aces -= 1
      end
    end
    hand_value
  end


  def busted?
    #get_value = calling a method on self (self not req'd)
    get_value > 21
  end

  def blackjack?
    @hand.count == 2 && self.get_value == 21
  end
end

class Person
  attr_accessor :hand
  attr_reader :name

  def initialize(name="Guest" + "#{rand(10)}")
    @name = name
    @hand = Hand.new
  end

  def get_score
    @hand.get_value
  end

  def busted?
    @hand.busted?
  end

  def blackjack?
    @hand.blackjack?
  end
end


class Player < Person
  attr_accessor :money
  def initialize(name, money= 100)
    @money = money
    super name #calls initialize on the parent class for the name variable
  end

  def in_game?
    @money >= 10
  end

  def win_money(bet, odds=1)
    @money = @money + (bet * odds)
  end

  def lose(bet)
    @money = @money - bet
  end
end

class Dealer < Person
  attr_accessor :deck
  def initialize
    super
    @deck = Deck.new
  end

  def deal(*people)
    people.each do |person|
      2.times {hit(person)}
    end
  end

  def deal_to_self
    2.times {@hand.add(@deck.draw)}
  end

  def hit(person)
    person.hand.add(@deck.draw)
  end

  #TODO: make sure this works
  def dealer_hit?
    self.get_score < 17
  end
end

# class Game
#   attr_accessor :money
#   def initialize(*players)
#     players.each do {Player.new(name)}
#   end
