require 'pry'

VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10',
          'Jack', 'Queen', 'King', 'Ace'].freeze

SUITS = ['Clubs', 'Hearts', 'Diamonds', 'Spades'].freeze
STAY = 17
PLAY_UNTIL = 21

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def deal_cards(hand)
  player_hand = []
  dealer_hand = []

  2.times do
    player_hand << hand.pop
    dealer_hand << hand.pop
  end
  return player_hand, dealer_hand
end

def bust?(hand)
  total(hand) > PLAY_UNTIL
end

def total(cards)
  # cards = [['H', '3'], ['S', 'Q']...]
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    if value == 'Ace'
      sum += 11
    elsif value.to_i == 0 # J, Q, K
      sum += 10
    else
      sum += value.to_i
    end
  end

  # correct for aces
  values.select { |value| value == 'Ace' }.count.times do
    sum -= 10 if sum > 21
  end
  sum
end

# def display_card_format_player(hand)
#   hand.map { |cards| cards[1] + ' of ' + cards[0] }.join(', ')
# end

# def display_card_format_dealer(hand)
#   hand.map { |card| card[1] + ' of ' + card[0] }.join(', ')
# end

def join_with_of_player(hand)
  hand.map { |cards| cards[1] + ' of ' + cards[0] }.join(', ')
end

def join_with_of_dealer(hand)
  hand.map { |cards| cards[1] + ' of ' + cards[0] }.join(', ')
end

#main game loop
system 'clear'
deck = initialize_deck
player_hand, dealer_hand = deal_cards(deck)

player_total = 0
dealer_total = 0

prompt "Welcome to a game of 21!"
prompt "========================"
# player turn
player_answer = nil
loop do
  player_total = total(player_hand)
  dealer_total = total(dealer_hand)
  prompt "Player has: #{join_with_of_player(player_hand)}"
  prompt "Your total is: #{player_total}"
  break if bust?(player_hand)
  prompt "Dealer has: #{join_with_of_dealer(dealer_hand)} and ?"
  prompt "Hit(h) or Stay(s)?"
  player_answer = gets.chomp
  system 'clear'
  
  break if player_answer.downcase.include?('s')
  player_hand << deck.pop
  
end

if bust?(player_hand)
  prompt "You busted! Game over.."
else
  prompt "You chose to stay with: #{join_with_of_player(player_hand)}"
  prompt "A total of: #{player_total}"
end

# dealer turn

loop do
  prompt "Dealer has: #{join_with_of_dealer(dealer_hand)}"
  sleep(2)
  break if bust?(dealer_hand) || total(dealer_hand) >= STAY
  if total(dealer_hand) < STAY
    prompt "Dealer chose to hit."
    dealer_hand << deck.pop
  end
end

if bust?(dealer_hand)
  prompt "Dealer busted! Game over.."
else
  prompt "Dealer chose to stay."
end





