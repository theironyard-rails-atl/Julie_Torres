CARDS = (2..10).to_a << :A, :J, :Q, :K


class Card
  attr_reader :cards
  def initialize(card)
    @cards = cards
  end

   def value
     case @cards
       when 2..9
         @cards.to_i
       when 10 || :J || :Q || :K
         10
       when :A
         1
     end
   end
end

test_card = Card.new(4)
puts test_card
puts test_card.value
