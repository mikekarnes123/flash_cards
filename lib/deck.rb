class Deck

  attr_reader :first_card,
              :second_card,
              :third_card

  def initialize(first_card, second_card, third_card)
    @first_card = first_card
    @second_card = second_card
    @third_card = third_card
  end
end
