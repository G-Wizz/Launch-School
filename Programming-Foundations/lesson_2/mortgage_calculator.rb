
require 'yaml'
MESSAGES = YAML.load_file('mortgage_calculator_messages.yml')

def prompt(message)
  puts "=> #{message}"
end

def integer?(input)
  input.to_i.to_s == input && input.to_i > 0
end

def float?(input)
  input.to_f.to_s == input && input.to_f > 0
end

def valid_number?(input)
  integer?(input) || float?(input)
end

def clear_screen
  system('clear') || system('cls')
end

prompt(MESSAGES['welcome'])

loop do
  prompt(MESSAGES['loan_amount'])

  loan_amount = ''
  loop do
    loan_amount = gets.chomp

    if valid_number?(loan_amount)
      break
    else
      prompt(MESSAGES['invalid_loan_amount'])
    end
  end

  prompt(MESSAGES['annual_apr'])
  prompt(MESSAGES['example'])

  interest_rate = ''
  loop do
    interest_rate = gets.chomp

    if valid_number?(interest_rate)
      break
    else
      prompt(MESSAGES['invalid_apr'])
    end
  end

  loan_in_years = ''
  prompt(MESSAGES['loan_years'])

  loop do
    loan_in_years = gets.chomp

    if valid_number?(loan_in_years)
      break
    else
      prompt(MESSAGES['valid_num_of_years'])
    end
  end

  apr = interest_rate.to_f / 100
  monthy_interest_rate = apr / 12
  loan_in_months = loan_in_years.to_i * 12

  monthly_payment = loan_amount.to_f *
                    (monthy_interest_rate /
                    (1 - (1 + monthy_interest_rate)**(-loan_in_months.to_i)))

  prompt("Your monthly payment will be $#{format('%02.2f', monthly_payment)}")

  prompt(MESSAGES['another_calculation'])
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
prompt(MESSAGES['thank_you'])
