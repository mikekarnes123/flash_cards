# require class files
require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'



#create cards
card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
card_4 = Card.new("Who is the CEO of Tesla?", "Elon Musk", :PopCulture)
card_5 = Card.new("What is the capital of Texas", "Austin", :Geography)
card_6 = Card.new("What is 10 + 10", "20", :STEM)

#put cards in deck
cards = [card_1, card_2, card_3, card_4, card_5, card_6]
deck = Deck.new(cards)
#create round using deck

round = Round.new(deck)

round.start

deck.cards.count.times do
  puts round.current_card.question
  current_guess = gets.chomp
  new_turn = round.take_turn(current_guess)
  round.turns.last.feedback
end
require 'pry'; binding.pry
puts "******* Game Over *******"
puts "You had #{round.number_correct} out of #{round.deck.cards.count} for a total score of #{round.percent_correct}%."
puts "Geography - #{round.percent_correct_by_category(:Geography)}%."
puts "STEM - #{round.percent_correct_by_category(:STEM)}%."
puts "Pop Culture - #{round.percent_correct_by_category(:PopCulture)}%."
