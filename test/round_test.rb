require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/round'
require './lib/deck'

class RoundTest < Minitest::Test

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

  def test_round_exists
    assert_instance_of Round, @round
  end

  def test_deck_exists
    assert_instance_of Deck, @deck
  end

  def test_cards_exist
    assert_instance_of Card, @card_1
    assert_instance_of Card, @card_2
    assert_instance_of Card, @card_3
  end

  def test_round_has_deck
    assert_equal @deck, @round.deck
  end

  def test_if_tracking_number_of_turns
    assert_equal [], @round.turns
  end

  def test_if_tracking_current_card
    assert_equal @card_1, @round.current_card
  end

  def test_take_turn_creates_new_turn
    new_turn = @round.take_turn("Juneau")
    assert_instance_of Turn, new_turn
  end

  def test_can_count_correct_number
    new_turn = @round.take_turn("Juneau")
    assert_equal 1, @round.number_correct
  end

  def test_can_track_percent_correct
    new_turn = @round.take_turn("Juneau")
    assert_equal 100.0, @round.percent_correct
  end

  def test_it_can_determine_number_correct_by_category
    new_turn = @round.take_turn("Juneau")
    assert_equal 1, @round.number_correct_by_category(:Geography)
  end

  def test_it_can_determine_percent_correct_by_category
    skip
    new_turn = @round.take_turn("Juneau")
    assert_equal 100.0, @round.percent_correct_by_category(:Geography)
  end

end
