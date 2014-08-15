require './blackjack'
require 'minitest/autorun'

describe Card do
  it "knows the values of number cards" do
    2.upto(10) do |x|
      card = Card.new(x)
      assert_equal card.value, x
    end
  end

  it "knows the values of face cards" do
    [:K, :Q, :J].each do |rank|
      card = Card.new(rank)
      assert_equal card.value, 10
    end
  end

  it "knows the value of an ace" do
    card = Card.new(:A)
    assert_equal card.value, 11
  end
end

describe Deck do
  def setup
    @deck = Deck.new
  end

  it "has the right number of cards" do
    assert_equal @deck.count, 52
  end

  it "knows how many cards are left after drawing" do
    @deck.draw
    assert_equal @deck.count, 51
  end

  it "tracks which cards have been drawn and which remain" do
    drawn_card = @deck.draw
    assert_equal @deck.count, 51
    refute_includes @deck, drawn_card
    assert_includes @drawn, drawn_card
  end
end

describe Hand do
  def setup
    @hand = Hand.new
  end

  it "computes values with number cards" do
    @hand.add(Card.new(9), Card.new(7))
    assert_equal @hand.hand_value, 16

    @hand.add(Card.new(4))
    assert_equal @hand.hand_value, 20
  end

  it "computes values with face cards" do
    @hand.add(Card.new(9), Card.new(:K))
    assert_equal @hand.hand_value, 19
  end

  it "computes values with aces" do
    @hand.add(Card.new(:A), Card.new(:K))
    assert_equal @hand.hand_value, 21

    @hand.add(Card.new(5))
    assert_equal @hand.hand_value, 16
  end

  # it "can bust" do
  #   @hand.add(Card.new(6), Card.new(:K), Card.new(9))
  #   assert @hand.busted?
  # end
  #
  # it "knows a blackjack" do
  #   @hand.add(Card.new(:A), Card.new(:K))
  #   assert @hand.blackjack?
  # end
  #
  # it "can be printed to string" do
  #   @hand.add(Card.new(:A), Card.new(:K))
  #   @hand.add(Card.new(5))
  #   assert_equal @hand.to_s, 'A, K, 5'
  # end
end
