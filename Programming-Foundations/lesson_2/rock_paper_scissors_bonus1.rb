require 'yaml'
MESSAGES = YAML.load_file('rock_paper_scissors_bonus1_messages.yml')

VALID_CHOICES = %w(rock paper scissors lizard spock)

WINNING_SCORE = 5

WINNER = {
  'rock' => %w(scissors lizard),
  'paper' => %w(rock spock),
  'scissors' => %w(paper lizard),
  'lizard' => %w(spock paper),
  'spock' => %w(scissors rock)
}

def test_method
  prompt('test message')
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  WINNER[first].include?(second)
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

def letter_to_word(letter)
  case letter
  when 'r' then 'rock'
  when 'p' then 'paper'
  when 's' then 'scissors'
  when 'l' then'lizard'
  when 'sp' then'spock'
  end
end

def clear_screen
  system('clear') || system('cls')
end

clear_screen

prompt(MESSAGES['welcome'])

loop do
  
    player_score = 0
    computer_score = 0
    
    choice = ''
  loop do
    loop do
      letter_choice = <<-LETTER
      Choose one: #{VALID_CHOICES.join(', ')}
         r for rock
         p for paper
         s for scissors
         l for lizard
         sp for spock
      LETTER
      prompt(letter_choice)

      choice = letter_to_word(gets.chomp.downcase)

      if VALID_CHOICES.include?(choice)
        break
      else
        prompt(MESSAGES['not_valid_choice'])
      end
    end

    computer_choice = VALID_CHOICES.sample

    prompt("You chose: #{choice}; Computer chose: #{computer_choice}")
   

  display_results(choice, computer_choice)

  if win?(choice, computer_choice)
    player_score += 1
  elsif win?(computer_choice, choice)
    computer_score += 1
  else
    player_score += 0
    computer_score += 0
  end

  prompt("** SCORE ** You: #{player_score} Computer: #{computer_score}")

  break if player_score == WINNING_SCORE || computer_score == WINNING_SCORE
  end

  prompt(MESSAGES['paly_again'])
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt(MESSAGES['thank_you'])
