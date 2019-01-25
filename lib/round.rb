class Round
  attr_reader :deck,
              :current_card,
              :turns,
              :number_correct

  def initialize(deck)
    @deck = deck
    @current_card = @deck.cards[0]
    @turns = []
    @number_correct = 0
  end

  def take_turn(guess)
    turn = Turn.new(guess, @current_card)
    @number_correct += 1 if turn.correct?
    @turns << turn
    @current_card = @deck.cards[@turns.length]
    return turn
  end



end
