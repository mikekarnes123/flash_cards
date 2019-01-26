require './lib/turn'

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

  def percent_correct
    (@number_correct/@turns.length.to_f)*100
  end

  def number_correct_by_category(category)
    num = @turns.find_all do |turn|
      turn.card.category == category && turn.correct?
    end
    num.length
  end

  def percent_correct_by_category(category)
    (number_correct_by_category(category)/@turns.length)*100
  end

end
