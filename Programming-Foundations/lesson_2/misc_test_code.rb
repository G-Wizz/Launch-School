# def winner(player, computer)
#   if player == WINNING_SCORE
#     prompt("You Won!")
#   elsif computer == WINNING_SCORE
#     prompt("The computer Won!")
# end


# winner(player_score, computer_score)

#   break if player_score == WINNING_SCORE || computer_score == WINNING_SCORE

#   if win?(choice, computer_choice)
#     player_score += 1
#   else win?(computer_choice, choice)
#     computer_score += 1
#   end

#   player_score = 0
#     computer_score = 0

# # All code is in random order

# if you_won?(player_score, computer_score) == WINNING_SCORE ||
#         you_won?(computer_score, player_score) == WINNING_SCORE
#         break    


VALID_CHOICES = %w(rock paper scissors spock lizard)

WINNING_SCORE = 5

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'rock' && second == 'lizard') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'paper' && second == 'spock') ||
    (first == 'scissors' && second == 'paper') ||
    (first == 'scissors' && second == 'lizard') ||
    (first == 'spock' && second == 'scissors') ||
    (first == 'spock' && second == 'rock') ||
    (first == 'lizard' && second == 'spock') ||
    (first == 'lizard' && second == 'paper')
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

def winner?(player, computer)
  if player == WINNING_SCORE
    prompt("GAME OVER! Player wins!!")
  elsif computer == WINNING_SCORE
    prompt("GAME OVER! Computer wins!!")
  end
end

loop do # GAME START
  player_score = 0
  computer_score = 0
  choice = ''
  loop do
    loop do
      prompt("Choose one: #{VALID_CHOICES.join(',')}")
      choice = Kernel.gets().chomp()

      if VALID_CHOICES.include?(choice)
        break
      else
        prompt("That's not a valid choice.")
      end
    end

    computer_choice = VALID_CHOICES.sample

    Kernel.puts("You chose: #{choice}; Computer chose: #{computer_choice}")

    display_results(choice, computer_choice)

    if win?(choice, computer_choice)
      player_score += 1
    elsif win?(computer_choice, choice)
      computer_score += 1
    end

    prompt("** SCORE ** Player: #{player_score} Computer: #{computer_score}")

    winner?(player_score, computer_score)

    break if player_score == WINNING_SCORE || computer_score == WINNING_SCORE
  end

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing. Good bye!")