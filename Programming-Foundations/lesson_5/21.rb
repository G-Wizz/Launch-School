

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

def join_with_of_dealer(hand)
  hand.map.with_index do |cards, index|
    if index != 0
      cards[1] + ' of ' + cards[0]
    else
      '?'
    end
  end.join(', ')
end

def join_with_of(hand)
  hand.map { |cards| cards[1] + ' of ' + cards[0] }.join(', ')
end

def display_player_results(hand, total)
  prompt "Player has: #{join_with_of(hand)}"
  prompt "Your total is: #{total}"
end

def display_dealer_results(hand, total)
  prompt "Dealer has: #{join_with_of_dealer(hand)}"
  prompt "With a total of: #{total}"
end

def calculate_winner(player_hand, dealer_hand)
  if total(player_hand) > total(dealer_hand) || bust?(dealer_hand)
    'player'
  elsif total(dealer_hand) > total(player_hand) || bust?(player_hand)
    'dealer'
  elsif total(dealer_hand) == total(player_hand)
    'tie'
  end
end

def display_winner(winner)
  case winner
  when 'player'
    prompt "You Win!"
  when 'dealer'
    prompt "Dealer Wins!"
  else
    prompt "It's a tie!"
  end
end

# main game loop
loop do
  system 'clear'
  deck = initialize_deck
  player_hand, dealer_hand = deal_cards(deck)

  player_total = 0

  prompt "Welcome to a game of 21!"
  prompt "========================"
  prompt "Dealing cards....."
  sleep(2)
  # player turn
  player_answer = nil

  loop do
    player_total = total(player_hand)
    display_player_results(player_hand, player_total)
    break if bust?(player_hand)
    prompt "Dealer has: #{join_with_of_dealer(dealer_hand)}"
    prompt "Hit(h) or Stay(s)?"
    player_answer = gets.chomp
    system 'clear'
    break if player_answer.downcase.include?('s')
    player_hand << deck.pop
  end

  if bust?(player_hand)
    prompt "You busted! Game over.."
  else
    prompt "You chose to stay with: #{join_with_of(player_hand)}"
    prompt "A total of: #{player_total}"
  end

  prompt "Dealer has: #{join_with_of_dealer(dealer_hand)}"
  loop do
    sleep(2)
    if total(dealer_hand) < STAY
      prompt "Dealer chose to hit with: #{join_with_of(dealer_hand)}"
      dealer_hand << deck.pop
    end
    break if bust?(dealer_hand) || total(dealer_hand) >= STAY
  end
  dealer_total = total(dealer_hand)

  if bust?(dealer_hand)
    prompt "Dealer busted! Game over.."
    prompt "Dealer has: #{join_with_of(dealer_hand)}"
    prompt "With a total of: #{dealer_total}"
  else
    prompt "Dealer chose to stay with: #{join_with_of(dealer_hand)}"
    prompt "With a total of: #{dealer_total}"
  end

  winner = calculate_winner(player_hand, dealer_hand)
  display_winner(winner)

  prompt "Would you like to play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.include?('y')
end
prompt "Thank you for playing 21! Good Bye"
